using LuaInterface;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using UnityEngine;
using UnityEngine.Networking;
using static ToLuaGameFramework.UIManager;

namespace ToLuaGameFramework
{
    class FileStruct
    {
        public bool isForStartup;
        public string title;
        public string fileName;
        public string md5;
    }

    public class AssetBundleInfo
    {
        public AssetBundle ab;
        public int referencedCount;
        public AssetBundleInfo(AssetBundle ab)
        {
            this.ab = ab;
            referencedCount = 0;
        }
    }
    public class ResManager : MonoBehaviour
    {
        public static ResManager instance;
        static Dictionary<string, FileStruct> localFiles = new Dictionary<string, FileStruct>();
        static Dictionary<string, FileStruct> loadSuccessFiles = new Dictionary<string, FileStruct>();
        static Dictionary<string, AssetBundleInfo> loadedAssetBundles = new Dictionary<string, AssetBundleInfo>();
        static List<string> preloadAssetBundleNames = new List<string>();
        static int totalPreloadAssetBundles;
        UnityWebRequest resRequest;
        FileStruct currDownloadFile;
        //参数：标题，进度，是否全部完成
        Action<string, float, bool> onFinish;

        void Awake()
        {
            instance = this;
        }

        void Update()
        {
            if (resRequest != null && currDownloadFile != null)
            {
                MessageCenter.Dispatch(MsgEnum.ABLoadingProgress, resRequest.downloadProgress, currDownloadFile.title);
                onFinish?.Invoke(currDownloadFile.title, resRequest.downloadProgress, false);
            }
        }

        #region 下载远程AssetBundle

        /// <summary>
        /// 开始增量更新远程资源
        /// </summary>
        /// <returns></returns>
        public void StartUpdateABOnStartup()
        {
            if (LuaConfig.UseLuaBundle || LuaConfig.UseResBundle)
            {
                Debug.Log("开始下载资源");
                StartCoroutine(CheckAndDownloadAB(null, null));
            }
            else
            {
                LuaManager.instance.StartLua();
            }
        }

        /// <summary>
        /// 判断某个AssetBundle是否已经下载(abName支持格式: Prefabs/Activities/DailyReward 或 prefabs_activities_dailyreward)
        /// </summary>
        /// <returns></returns>
        public bool IsABLoaded(string abName)
        {
            string abPath = LuaConst.localABPath + "/" + ABName(abName);
            if (!File.Exists(abPath))
            {
                return false;
            }
            return true;
        }

        /// <summary>
        /// 指定AB包更新(回调参数：标题，进度，是否全部完成)
        /// </summary>
        /// <returns></returns>
        public void UpdateABsByNames(string[] abNames, Action<string, float, bool> onFinish)
        {
            StartCoroutine(CheckAndDownloadAB(abNames, onFinish));
        }

        /// <summary>
        /// 更新AB包(abNames为null时，更新所有isForStartup的资源)(回调参数：标题，进度，是否全部完成)
        /// </summary>
        IEnumerator CheckAndDownloadAB(string[] abNames, Action<string, float, bool> onFinish)
        {
            Debug.Log("开始下载资源");
            this.onFinish = onFinish;
            //读取本地MD5文件
            localFiles = new Dictionary<string, FileStruct>();
            string localFilesPath = LuaConst.localABPath + "/" + LuaConst.MD5FileName;
            Debug.Log("localFilesPath: " + localFilesPath);
            if (File.Exists(localFilesPath))
            {
                localFiles = ParseKeyValue(File.ReadAllText(localFilesPath));
            }
            //下载远程MD5文件
            string filesUrl = LuaConfig.RemoteUrl + "/" + LuaConst.MD5FileName;
            UnityWebRequest request = UnityWebRequest.Get(filesUrl);
            yield return request.SendWebRequest();
            if (request.error != null)
            {
                Debug.LogError("[ " + filesUrl + " ]" + request.error);
                yield break;
            }
            if (!Directory.Exists(LuaConst.localABPath)) Directory.CreateDirectory(LuaConst.localABPath);
            Dictionary<string, FileStruct> newestFiles = ParseKeyValue(request.downloadHandler.text);
            if (abNames != null)
            {
                for (int i = 0; i < abNames.Length; i++)
                {
                    string abName = ABName(abNames[i]);
                    if (!newestFiles.ContainsKey(abName))
                    {
                        Debug.LogError("服务器找不到" + abName);
                    }
                }
            }
            Dictionary<string, FileStruct> reloadFiles = new Dictionary<string, FileStruct>();
            foreach (var item in newestFiles)
            {
                bool canLoad = false;
                if (abNames != null)
                {
                    for (int i = 0; i < abNames.Length; i++)
                    {
                        string abName = ABName(abNames[i]);
                        if (item.Key.Equals(abName))
                        {
                            canLoad = true;
                            break;
                        }
                    }
                }
                else
                {
                    canLoad = item.Value.isForStartup;
                }
                if (!LuaConfig.UseLuaBundle)
                {
                    if (item.Key.Equals("lua.zip"))
                    {
                        canLoad = false;
                    }
                }
                if (!LuaConfig.UseResBundle)
                {
                    if (!item.Key.Equals("lua.zip"))
                    {
                        canLoad = false;
                    }
                }
                if (canLoad)
                {
                    bool localHaveKey = localFiles.ContainsKey(item.Key);
                    if (!localHaveKey)
                    {
                        //是新的文件，加入加载
                        Debug.Log(item.Key + " 是新的文件，加入加载");
                        if (item.Key.EndsWith(LuaConst.ExtName)) reloadFiles.Add(item.Key, item.Value);
                    }
                    else
                    {
                        bool fileExists = File.Exists(LuaConst.localABPath + "/" + item.Key);
                        if (!fileExists)
                        {
                            //本地找不到，加入下载
                            Debug.Log(item.Key + " 本地找不到，加入下载");
                            if (item.Key.EndsWith(LuaConst.ExtName)) reloadFiles.Add(item.Key, item.Value);
                        }
                        else
                        {
                            FileStruct localInfo = localFiles[item.Key];
                            bool md5Match = localInfo.md5.Equals(item.Value.md5);
                            if (!md5Match)
                            {
                                //文件有改动，加入下载
                                Debug.Log(item.Key + " 文件有改动，加入下载");
                                if (item.Key.EndsWith(LuaConst.ExtName)) reloadFiles.Add(item.Key, item.Value);
                            }
                        }
                    }
                }
            }
            Debug.Log("下载资源数量：" + reloadFiles.Count);
            if (reloadFiles.Count > 0)
            {
                MessageCenter.Dispatch(MsgEnum.ABLoadingBegin);
            }
            foreach (var item in reloadFiles)
            {
                MessageCenter.Dispatch(MsgEnum.ABLoadingProgress, 0, item.Value.title);
                string url = LuaConfig.RemoteUrl + "/" + item.Key;
                if (!item.Key.Contains(".")) continue;
                Debug.Log("下载" + item.Value.title + "资源：" + url);
                resRequest = UnityWebRequest.Get(url);
                currDownloadFile = item.Value;
                yield return resRequest.SendWebRequest();
                if (resRequest.error != null)
                {
                    Debug.LogError(" [ " + url + " ] " + resRequest.error);
                    MessageCenter.Dispatch(MsgEnum.ABLoadingError, resRequest.error);
                }
                string savePath = LuaConst.localABPath + "/" + item.Key;
                string saveDir = savePath.Substring(0, savePath.LastIndexOf("/"));
                if (!Directory.Exists(saveDir)) Directory.CreateDirectory(saveDir);
                File.WriteAllBytes(savePath, resRequest.downloadHandler.data);
                loadSuccessFiles[item.Key] = item.Value;
            }
            if (resRequest != null)
            {
                resRequest.Dispose();
                resRequest = null;
            }
            currDownloadFile = null;
            MessageCenter.Dispatch(MsgEnum.ABLoadingFinish);
            onFinish?.Invoke("", 1, true);
            UpdateLocalFiles();
            if (onFinish == null)
            {
                yield return new WaitForEndOfFrame();
                LuaManager.instance.StartLua();
            }
        }

        #endregion

        #region 预加载本地AssetBundle

        /// <summary>
        /// Lua调用,预加载AssetBundle列表，传入目录路径
        /// </summary>
        public static void PreloadLocalAssetBundles(string[] abPaths, LuaFunction onProgress)
        {
            if (!LuaConfig.UseResBundle)
            {
                onProgress?.Call(1);
                return;
            }
            preloadAssetBundleNames.Clear();
            for (int i = 0; i < abPaths.Length; i++)
            {
                string path = abPaths[i];
                string abName = null;
                string prefabName = null;
                ParseAssetPath(path, out abName, out prefabName);
                foreach (var item in localFiles.Keys)
                {
                    if (item.EndsWith(LuaConst.ExtName) && item.StartsWith(abName))
                    {
                        string name = item.Substring(0, item.Length - LuaConst.ExtName.Length);
                        if (!preloadAssetBundleNames.Contains(name))
                        {
                            preloadAssetBundleNames.Add(name);
                        }
                    }
                }
            }
            totalPreloadAssetBundles = preloadAssetBundleNames.Count;
            instance.StartCoroutine(PreloadAssetBundle(onProgress));
        }

        /// <summary>
        /// Lua调用,将预加载好的AssetBundle全部卸载，是否包括它的所有Spawn,由参数传入
        /// </summary>
        public void UnloadAllAssetBundles(bool unloadAllLoadedObjects)
        {
            foreach (var item in loadedAssetBundles.Values)
            {
                AssetBundle ab = item.ab;
                ab.Unload(unloadAllLoadedObjects);
            }
            loadedAssetBundles.Clear();
            ClearMemory();
        }

        #endregion

        #region 创建对象

        /// <summary>
        /// 同步创建对象(prefabPath不带后缀名)
        /// </summary>
        public static GameObject SpawnPrefab(string prefabPath, Transform parent, bool unloadABAfterSpawn = false, bool unloadABAfterAllSpawnDestroy = false)
        {
            if (string.IsNullOrEmpty(prefabPath))
            {
                Debug.LogError("prefabPath为空");
                return null;
            }
            if (LuaConfig.UseResBundle)
            {
                string abName = null;
                string prefabName = null;
                ParseAssetPath(prefabPath, out abName, out prefabName);
                GameObject prefab = LoadAssetFromAssetBundleSyn<GameObject>(abName, prefabName, unloadABAfterSpawn);
                GameObject go = Instantiate(prefab);
                if (parent) go.transform.SetParent(parent, false);
                LuaBehaviour luaBehaviour = go.AddComponent<LuaBehaviour>();
                luaBehaviour.assetBundleName = abName;
                luaBehaviour.prefabPath = prefabPath;
                luaBehaviour.unloadABAfterAllSpawnDestroy = unloadABAfterAllSpawnDestroy;
                return luaBehaviour.gameObject;
            }
            else
            {
#if UNITY_EDITOR
                string prefabFullPath = Application.dataPath + "/" + LuaConfig.LuaDevPath + "/" + prefabPath + ".prefab";
                prefabFullPath = prefabFullPath.Substring(prefabFullPath.IndexOf("Assets/"));
                GameObject prefab = UnityEditor.AssetDatabase.LoadAssetAtPath<GameObject>(prefabFullPath);
                GameObject go = Instantiate(prefab);
                if (parent) go.transform.SetParent(parent, false);
                LuaBehaviour luaBehaviour = go.AddComponent<LuaBehaviour>();
                luaBehaviour.assetBundleName = "";
                luaBehaviour.prefabPath = prefabPath;
                luaBehaviour.unloadABAfterAllSpawnDestroy = unloadABAfterAllSpawnDestroy;
                return luaBehaviour.gameObject;
#else
                return null;
#endif
            }
        }

        /// <summary>
        /// 异步创建对象(prefabPath不带后缀名)
        /// </summary>
        public static void SpawnPrefabAsyn(string prefabPath, Transform parent, LuaFunction callback, bool unloadABAfterSpawn = false, bool unloadABAfterAllSpawnDestroy = false)
        {
            if (string.IsNullOrEmpty(prefabPath))
            {
                Debug.LogError("prefabPath为空");
                return;
            }
            if (LuaConfig.UseResBundle)
            {
                string abName = null;
                string prefabName = null;
                ParseAssetPath(prefabPath, out abName, out prefabName);
                instance.StartCoroutine(LoadAssetFromAssetBundleAsyn(abName, prefabName, (GameObject prefab) =>
                {
                    GameObject go = Instantiate(prefab);
                    if (parent) go.transform.SetParent(parent, false);
                    LuaBehaviour luaBehaviour = go.AddComponent<LuaBehaviour>();
                    luaBehaviour.assetBundleName = abName;
                    luaBehaviour.prefabPath = prefabPath;
                    luaBehaviour.unloadABAfterAllSpawnDestroy = unloadABAfterAllSpawnDestroy;
                    if (!string.IsNullOrEmpty(callback + ""))
                    {
                        if (callback.GetType() == typeof(M_LuaFunction))
                        {
                            ((M_LuaFunction)callback).action.Invoke(luaBehaviour.gameObject);
                        }
                        else
                        {
                            callback.Call(luaBehaviour.gameObject, false);
                        }
                    }
                }, unloadABAfterSpawn));
            }
            else
            {
#if UNITY_EDITOR
                string prefabFullPath = Application.dataPath + "/" + LuaConfig.LuaDevPath + "/" + prefabPath + ".prefab";
                prefabFullPath = prefabFullPath.Substring(prefabFullPath.IndexOf("Assets/"));
                GameObject prefab = UnityEditor.AssetDatabase.LoadAssetAtPath<GameObject>(prefabFullPath);
                GameObject go = Instantiate(prefab);
                if (parent) go.transform.SetParent(parent, false);
                LuaBehaviour luaBehaviour = go.AddComponent<LuaBehaviour>();
                luaBehaviour.assetBundleName = "";
                luaBehaviour.prefabPath = prefabPath;
                luaBehaviour.unloadABAfterAllSpawnDestroy = unloadABAfterAllSpawnDestroy;
                if (!string.IsNullOrEmpty(callback + ""))
                {
                    if (callback.GetType() == typeof(M_LuaFunction))
                    {
                        ((M_LuaFunction)callback).action.Invoke(luaBehaviour.gameObject);
                    }
                    else
                    {
                        callback.Call(luaBehaviour.gameObject, false);
                    }
                }
#endif
            }
        }

        /// <summary>
        /// 清除AssetBundle(自动判断引用数量为0时回收AssetBundle)
        /// </summary>
        public void OnSpawnDestroy(string bundleName, bool unloadABAfterAllSpawnDestroy)
        {
            if (loadedAssetBundles.ContainsKey(bundleName))
            {
                AssetBundleInfo abInfo = loadedAssetBundles[bundleName];
                abInfo.referencedCount--;
                if (abInfo.referencedCount <= 0 && unloadABAfterAllSpawnDestroy)
                {
                    abInfo.ab.Unload(true);
                    loadedAssetBundles.Remove(bundleName);
                }
            }
        }

        /// <summary>
        /// 同步获取资源(assetPath不带后缀名)
        /// </summary>
        public static T LoadAssetSyn<T>(string assetPath, bool unloadABAfterSpawn = false) where T : UnityEngine.Object
        {
            if (LuaConfig.UseResBundle)
            {
                string abName = null;
                string assetName = null;
                ParseAssetPath(assetPath, out abName, out assetName);
                return LoadAssetFromAssetBundleSyn<T>(abName, assetName, unloadABAfterSpawn);
            }
            else
            {
#if UNITY_EDITOR
                string prefabFullPath = AddSuffix(Application.dataPath + "/" + LuaConfig.LuaDevPath + "/" + assetPath);
                prefabFullPath = prefabFullPath.Substring(prefabFullPath.IndexOf("Assets/"));
                T asset = UnityEditor.AssetDatabase.LoadAssetAtPath<T>(prefabFullPath);
                return asset;
#else
                return default(T);
#endif
            }
        }

        /// <summary>
        /// 异步获取资源(assetPath不带后缀名)
        /// </summary>
        public static void LoadAssetAsyn<T>(string assetPath, Action<T> callback, bool unloadABAfterSpawn = false) where T : UnityEngine.Object
        {
            if (LuaConfig.UseResBundle)
            {
                string abName = null;
                string assetName = null;
                ParseAssetPath(assetPath, out abName, out assetName);
                instance.StartCoroutine(LoadAssetFromAssetBundleAsyn(abName, assetName, callback, unloadABAfterSpawn));
            }
            else
            {
#if UNITY_EDITOR
                string prefabFullPath = AddSuffix(Application.dataPath + "/" + LuaConfig.LuaDevPath + "/" + assetPath);
                prefabFullPath = prefabFullPath.Substring(prefabFullPath.IndexOf("Assets/"));
                T asset = UnityEditor.AssetDatabase.LoadAssetAtPath<T>(prefabFullPath);
                callback?.Invoke(asset);
#endif
            }
        }

        /// <summary>
        /// 清理内存
        /// </summary>
        public void ClearMemory()
        {
            //Debug.LogError("主动GC");
            Resources.UnloadUnusedAssets();
            GC.Collect();
            LuaManager.instance.LuaGC();
        }
        #endregion

        #region 内部方法

        /// <summary>
        /// 自动查找文件加上后缀名
        /// </summary>
        static string AddSuffix(string assetPath)
        {
            string path = assetPath.Substring(0, assetPath.LastIndexOf('/'));
            string name = assetPath.Substring(assetPath.LastIndexOf('/') + 1);
            string[] files = Directory.GetFiles(path, name + ".*", SearchOption.TopDirectoryOnly);
            for (int i = 0; i < files.Length; i++)
            {
                string _path = files[i];
                if (!_path.EndsWith(".meta"))
                {
                    return _path;
                }
            }
            return null;
        }


        /// <summary>
        /// 从AssetBundle里同步获取资源
        /// </summary>
        static T LoadAssetFromAssetBundleSyn<T>(string abName, string assetName, bool unloadABAfterSpawn = false) where T : UnityEngine.Object
        {
            T prefab = null;
            AssetBundleInfo abInfo = null;
            loadedAssetBundles.TryGetValue(abName, out abInfo);
            if (abInfo == null)
            {
                string localUrl = LuaConst.localABPath + "/" + abName + LuaConst.ExtName;
                AssetBundle ab = AssetBundle.LoadFromFile(localUrl);
                if (unloadABAfterSpawn)
                {
                    prefab = ab.LoadAsset<T>(assetName);
                    ab.Unload(false);
                }
                else
                {
                    abInfo = new AssetBundleInfo(ab);
                    prefab = abInfo.ab.LoadAsset<T>(assetName);
                    abInfo.referencedCount++;
                    loadedAssetBundles.Add(abName, abInfo);
                }
            }
            else
            {
                prefab = abInfo.ab.LoadAsset<T>(assetName);
                abInfo.referencedCount++;
                if (unloadABAfterSpawn)
                {
                    abInfo.ab.Unload(false);
                    loadedAssetBundles.Remove(abName);
                }
            }
            return prefab;
        }

        /// <summary>
        /// 从AssetBundle里异步获取资源
        /// </summary>
        static IEnumerator LoadAssetFromAssetBundleAsyn<T>(string abName, string assetName, Action<T> callback, bool unloadABAfterSpawn = false) where T : UnityEngine.Object
        {
            AssetBundleInfo abInfo = null;
            loadedAssetBundles.TryGetValue(abName, out abInfo);
            if (abInfo == null)
            {
                string localUrl = LuaConst.localABPath + "/" + abName + LuaConst.ExtName;
                UnityWebRequest request = UnityWebRequestAssetBundle.GetAssetBundle(localUrl);
                yield return request.SendWebRequest();
                if (request.error != null)
                {
                    Debug.LogError(" [ " + localUrl + " ] " + request.error);
                }
                AssetBundle ab = (request.downloadHandler as DownloadHandlerAssetBundle).assetBundle;
                if (unloadABAfterSpawn)
                {
                    T prefab = ab.LoadAsset<T>(assetName);
                    callback?.Invoke(prefab);
                    ab.Unload(false);
                }
                else
                {
                    abInfo = new AssetBundleInfo(ab);
                    T prefab = abInfo.ab.LoadAsset<T>(assetName);
                    if (callback != null)
                    {
                        callback(prefab);
                        abInfo.referencedCount++;
                    }
                    loadedAssetBundles.Add(abName, abInfo);
                }
            }
            else
            {
                T prefab = abInfo.ab.LoadAsset<T>(assetName);
                if (callback != null)
                {
                    callback(prefab);
                    abInfo.referencedCount++;
                }
                if (unloadABAfterSpawn)
                {
                    abInfo.ab.Unload(false);
                    loadedAssetBundles.Remove(abName);
                }
            }
        }

        static void ParseAssetPath(string assetPath, out string abName, out string assetName)
        {
            abName = assetPath.ToLower();
            assetName = assetPath;
            if (assetPath.Contains("/"))
            {
                assetName = assetPath.Substring(assetPath.LastIndexOf("/") + 1);
                abName = assetPath.Substring(0, assetPath.LastIndexOf("/")).ToLower();
                if (abName.Contains("/"))
                {
                    abName = abName.Replace("/", "_");
                    string localUrl = LuaConst.localABPath + "/" + abName + LuaConst.ExtName;
                    while (!File.Exists(localUrl) && abName.Contains("_"))
                    {
                        abName = abName.Substring(0, abName.LastIndexOf("_"));
                        localUrl = LuaConst.localABPath + "/" + abName + LuaConst.ExtName;
                    }
                }
            }
        }

        static IEnumerator PreloadAssetBundle(LuaFunction onProgress)
        {
            while (preloadAssetBundleNames.Count > 0)
            {
                string abName = preloadAssetBundleNames[0];
                preloadAssetBundleNames.RemoveAt(0);
                AssetBundleInfo abInfo = null;
                loadedAssetBundles.TryGetValue(abName, out abInfo);
                if (abInfo == null)
                {
                    string localUrl = LuaConst.localABPath + "/" + abName + LuaConst.ExtName;
                    UnityWebRequest request = UnityWebRequestAssetBundle.GetAssetBundle(localUrl);
                    yield return request.SendWebRequest();
                    if (request.error != null)
                    {
                        Debug.LogError(" [ " + localUrl + " ] " + request.error);
                    }
                    AssetBundle ab = (request.downloadHandler as DownloadHandlerAssetBundle).assetBundle;
                    abInfo = new AssetBundleInfo(ab);
                    loadedAssetBundles.Add(abName, abInfo);
                }
                onProgress?.Call((totalPreloadAssetBundles - preloadAssetBundleNames.Count) / (float)totalPreloadAssetBundles);
            }
        }

        Dictionary<string, FileStruct> ParseKeyValue(string filesContent)
        {
            Dictionary<string, FileStruct> infos = new Dictionary<string, FileStruct>();
            try
            {
                string[] files = filesContent.Split('\n');
                for (int i = 0; i < files.Length; i++)
                {
                    if (string.IsNullOrEmpty(files[i])) continue;
                    FileStruct info = new FileStruct();
                    string[] keyValue = files[i].Split('|');
                    info.isForStartup = "0".Equals(keyValue[0]);
                    info.title = keyValue[1];
                    info.fileName = keyValue[2];
                    info.md5 = keyValue[3].Replace("\n", "").Trim();
                    infos.Add(info.fileName, info);
                }
            }
            catch (Exception e)
            {
                Debug.LogError(e);
            }
            return infos;
        }
        void UpdateLocalFiles()
        {
            //仅更新下载成功的文件
            foreach (var item in loadSuccessFiles)
            {
                localFiles[item.Key] = item.Value;
            }
            StringBuilder stringBuilder = new StringBuilder();
            foreach (var item in localFiles)
            {
                string isForStartup = item.Value.isForStartup ? "0" : "1";
                stringBuilder.Append(isForStartup + "|" + item.Value.title + "|" + item.Key + "|" + item.Value.md5 + "\n");
            }
            File.WriteAllText(LuaConst.localABPath + "/" + LuaConst.MD5FileName, stringBuilder.ToString());
        }

        string ABName(string abName)
        {
            abName = abName.Replace("/", "_").ToLower();
            if (!abName.EndsWith(".zip")) abName += ".zip";
            return abName;
        }
        #endregion
    }

}