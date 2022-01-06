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
        public AssetBundle assetBundle;
        public int referencedCount;
        public AssetBundleInfo(AssetBundle assetBundle)
        {
            this.assetBundle = assetBundle;
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
            if (LuaConfig.UseAssetBundleLua || LuaConfig.UseAssetBundleRes)
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
                        Debug.LogError(abName + "在服务器上不存在");
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
                if (!LuaConfig.UseAssetBundleLua)
                {
                    if (item.Key.Equals("lua.zip"))
                    {
                        canLoad = false;
                    }
                }
                if (!LuaConfig.UseAssetBundleRes)
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
        public static void PreloadLocalAssetBundles(string[] assetBundlePaths, LuaFunction onProgress)
        {
            if (!LuaConfig.UseAssetBundleRes)
            {
                if (onProgress != null)
                {
                    onProgress.Call(1);
                }
                return;
            }
            preloadAssetBundleNames.Clear();
            for (int i = 0; i < assetBundlePaths.Length; i++)
            {
                string path = assetBundlePaths[i].Replace("\\", "/");
                if (path.Contains("Resources/Prefabs"))
                {
                    path = path.Substring(path.IndexOf("/Prefabs") + 1);
                }
                string namePrefix = null;
                if (path.Contains("/"))
                {
                    namePrefix = path.Replace("/", "_").ToLower();
                }
                else
                {
                    namePrefix = path.ToLower();
                }
                foreach (var item in localFiles.Keys)
                {
                    if (item.EndsWith(LuaConst.ExtName) && item.StartsWith(namePrefix))
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
                AssetBundle assetBundle = item.assetBundle;
                assetBundle.Unload(unloadAllLoadedObjects);
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
            if (LuaConfig.UseAssetBundleRes)
            {
                string assetBundleName = null;
                string prefabName = null;
                ParseAssetPath(prefabPath, ref assetBundleName, ref prefabName);
                GameObject prefab = LoadAssetFromAssetBundleSyn<GameObject>(assetBundleName, prefabName, unloadABAfterSpawn);
                GameObject go = Instantiate(prefab);
                if (parent) go.transform.SetParent(parent, false);
                LuaBehaviour luaBehaviour = go.AddComponent<LuaBehaviour>();
                luaBehaviour.assetBundleName = assetBundleName;
                luaBehaviour.prefabPath = prefabPath;
                luaBehaviour.unloadABAfterAllSpawnDestroy = unloadABAfterAllSpawnDestroy;
                return luaBehaviour.gameObject;
            }
            else
            {
                GameObject prefab = null;
                string resourcesTag = "/Resources";
                if (LuaConfig.LuaDevPath.Contains(resourcesTag))
                {
                    string prefabFullPath = LuaConfig.LuaDevPath + "/" + prefabPath;
                    prefabFullPath = prefabFullPath.Substring(prefabFullPath.IndexOf(resourcesTag) + resourcesTag.Length + 1);
                    prefab = Resources.Load<GameObject>(prefabFullPath);
                }
                else
                {
#if UNITY_EDITOR
                    string prefabFullPath = LuaConfig.LuaDevPath + "/" + prefabPath + ".prefab";
                    prefabFullPath = prefabFullPath.Substring(prefabFullPath.IndexOf("Assets/"));
                    prefab = UnityEditor.AssetDatabase.LoadAssetAtPath<GameObject>(prefabFullPath);
#else
                    Debug.LogError("导出前须配置Config.UseAssetBundle=true或将Lua开发目录移动到Resources目录内");
#endif
                }
                GameObject go = Instantiate(prefab);
                if (parent) go.transform.SetParent(parent, false);
                LuaBehaviour luaBehaviour = go.AddComponent<LuaBehaviour>();
                luaBehaviour.assetBundleName = "";
                luaBehaviour.prefabPath = prefabPath;
                luaBehaviour.unloadABAfterAllSpawnDestroy = unloadABAfterAllSpawnDestroy;
                return luaBehaviour.gameObject;
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
            if (LuaConfig.UseAssetBundleRes)
            {
                string assetBundleName = null;
                string prefabName = null;
                ParseAssetPath(prefabPath, ref assetBundleName, ref prefabName);
                instance.StartCoroutine(LoadAssetFromAssetBundleAsyn(assetBundleName, prefabName, (GameObject prefab) =>
                {
                    GameObject go = Instantiate(prefab);
                    if (parent) go.transform.SetParent(parent, false);
                    LuaBehaviour luaBehaviour = go.AddComponent<LuaBehaviour>();
                    luaBehaviour.assetBundleName = assetBundleName;
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
                GameObject prefab = null;
                string resourcesTag = "/Resources";
                if (LuaConfig.LuaDevPath.Contains(resourcesTag))
                {
                    string prefabFullPath = LuaConfig.LuaDevPath + "/" + prefabPath;
                    prefabFullPath = prefabFullPath.Substring(prefabFullPath.IndexOf(resourcesTag) + resourcesTag.Length + 1);
                    prefab = Resources.Load<GameObject>(prefabFullPath);
                }
                else
                {
#if UNITY_EDITOR
                    string prefabFullPath = LuaConfig.LuaDevPath + "/" + prefabPath + ".prefab";
                    prefabFullPath = prefabFullPath.Substring(prefabFullPath.IndexOf("Assets/"));
                    prefab = UnityEditor.AssetDatabase.LoadAssetAtPath<GameObject>(prefabFullPath);
#else
                    Debug.LogError("导出前须配置Config.UseAssetBundle=true或将Lua开发目录移动到Resources目录内");
#endif
                }
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
            }
        }

        /// <summary>
        /// 清除AssetBundle(自动判断引用数量为0时回收AssetBundle)
        /// </summary>
        public void OnSpawnDestroy(string bundleName, bool unloadABAfterAllSpawnDestroy)
        {
            if (loadedAssetBundles.ContainsKey(bundleName))
            {
                AssetBundleInfo assetBundleInfo = loadedAssetBundles[bundleName];
                assetBundleInfo.referencedCount--;
                if (assetBundleInfo.referencedCount <= 0 && unloadABAfterAllSpawnDestroy)
                {
                    assetBundleInfo.assetBundle.Unload(true);
                    loadedAssetBundles.Remove(bundleName);
                }
            }
        }

        /// <summary>
        /// 同步获取资源(assetPath不带后缀名)
        /// </summary>
        public static T LoadAssetSyn<T>(string assetPath, bool unloadABAfterSpawn = false) where T : UnityEngine.Object
        {
            if (LuaConfig.UseAssetBundleRes)
            {
                string assetBundleName = null;
                string assetName = null;
                ParseAssetPath(assetPath, ref assetBundleName, ref assetName);
                return LoadAssetFromAssetBundleSyn<T>(assetBundleName, assetName, unloadABAfterSpawn);
            }
            else
            {
                T asset = null;
                string resourcesTag = "/Resources";
                if (LuaConfig.LuaDevPath.Contains(resourcesTag))
                {
                    string prefabFullPath = LuaConfig.LuaDevPath + "/" + assetPath;
                    prefabFullPath = prefabFullPath.Substring(prefabFullPath.IndexOf(resourcesTag) + resourcesTag.Length + 1);
                    asset = Resources.Load<T>(prefabFullPath);
                }
                else
                {
#if UNITY_EDITOR
                    string prefabFullPath = AddSuffix(LuaConfig.LuaDevPath + "/" + assetPath);
                    prefabFullPath = prefabFullPath.Substring(prefabFullPath.IndexOf("Assets/"));
                    asset = UnityEditor.AssetDatabase.LoadAssetAtPath<T>(prefabFullPath);
#else
                    Debug.LogError("导出前须配置Config.UseAssetBundle=true或将Lua开发目录移动到Resources目录内");
#endif
                }
                return asset;
            }
        }

        /// <summary>
        /// 异步获取资源(assetPath不带后缀名)
        /// </summary>
        public static void LoadAssetAsyn<T>(string assetPath, Action<T> callback, bool unloadABAfterSpawn = false) where T : UnityEngine.Object
        {
            if (LuaConfig.UseAssetBundleRes)
            {
                string assetBundleName = null;
                string assetName = null;
                ParseAssetPath(assetPath, ref assetBundleName, ref assetName);
                instance.StartCoroutine(LoadAssetFromAssetBundleAsyn(assetBundleName, assetName, callback, unloadABAfterSpawn));
            }
            else
            {
                T asset = null;
                string resourcesTag = "/Resources";
                if (LuaConfig.LuaDevPath.Contains(resourcesTag))
                {
                    string prefabFullPath = LuaConfig.LuaDevPath + "/" + assetPath;
                    prefabFullPath = prefabFullPath.Substring(prefabFullPath.IndexOf(resourcesTag) + resourcesTag.Length + 1);
                    asset = Resources.Load<T>(prefabFullPath);
                }
                else
                {
#if UNITY_EDITOR
                    string prefabFullPath = AddSuffix(LuaConfig.LuaDevPath + "/" + assetPath);
                    prefabFullPath = prefabFullPath.Substring(prefabFullPath.IndexOf("Assets/"));
                    asset = UnityEditor.AssetDatabase.LoadAssetAtPath<T>(prefabFullPath);
#else
                    Debug.LogError("导出前须配置Config.UseAssetBundle=true或将Lua开发目录移动到Resources目录内");
#endif
                }
                if (callback != null) callback(asset);
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
        static T LoadAssetFromAssetBundleSyn<T>(string assetBundleName, string assetName, bool unloadABAfterSpawn = false) where T : UnityEngine.Object
        {
            T prefab = null;
            AssetBundleInfo assetBundleInfo = null;
            loadedAssetBundles.TryGetValue(assetBundleName, out assetBundleInfo);
            if (assetBundleInfo == null)
            {
                string localUrl = LuaConst.localABPath + "/" + assetBundleName + LuaConst.ExtName;
                AssetBundle assetBundle = AssetBundle.LoadFromFile(localUrl);
                if (unloadABAfterSpawn)
                {
                    prefab = assetBundle.LoadAsset<T>(assetName);
                    assetBundle.Unload(false);
                }
                else
                {
                    assetBundleInfo = new AssetBundleInfo(assetBundle);
                    prefab = assetBundleInfo.assetBundle.LoadAsset<T>(assetName);
                    assetBundleInfo.referencedCount++;
                    loadedAssetBundles.Add(assetBundleName, assetBundleInfo);
                }
            }
            else
            {
                prefab = assetBundleInfo.assetBundle.LoadAsset<T>(assetName);
                assetBundleInfo.referencedCount++;
                if (unloadABAfterSpawn)
                {
                    assetBundleInfo.assetBundle.Unload(false);
                    loadedAssetBundles.Remove(assetBundleName);
                }
            }
            return prefab;
        }

        /// <summary>
        /// 从AssetBundle里异步获取资源
        /// </summary>
        static IEnumerator LoadAssetFromAssetBundleAsyn<T>(string assetBundleName, string assetName, Action<T> callback, bool unloadABAfterSpawn = false) where T : UnityEngine.Object
        {
            AssetBundleInfo assetBundleInfo = null;
            loadedAssetBundles.TryGetValue(assetBundleName, out assetBundleInfo);
            if (assetBundleInfo == null)
            {
                string localUrl = LuaConst.localABPath + "/" + assetBundleName + LuaConst.ExtName;
                UnityWebRequest request = UnityWebRequestAssetBundle.GetAssetBundle(localUrl);
                yield return request.SendWebRequest();
                if (request.error != null)
                {
                    Debug.LogError(" [ " + localUrl + " ] " + request.error);
                }
                AssetBundle assetBundle = (request.downloadHandler as DownloadHandlerAssetBundle).assetBundle;
                if (unloadABAfterSpawn)
                {
                    T prefab = assetBundle.LoadAsset<T>(assetName);
                    if (callback != null) callback(prefab);
                    assetBundle.Unload(false);
                }
                else
                {
                    assetBundleInfo = new AssetBundleInfo(assetBundle);
                    T prefab = assetBundleInfo.assetBundle.LoadAsset<T>(assetName);
                    if (callback != null)
                    {
                        callback(prefab);
                        assetBundleInfo.referencedCount++;
                    }
                    loadedAssetBundles.Add(assetBundleName, assetBundleInfo);
                }
            }
            else
            {
                T prefab = assetBundleInfo.assetBundle.LoadAsset<T>(assetName);
                if (callback != null)
                {
                    callback(prefab);
                    assetBundleInfo.referencedCount++;
                }
                if (unloadABAfterSpawn)
                {
                    assetBundleInfo.assetBundle.Unload(false);
                    loadedAssetBundles.Remove(assetBundleName);
                }
            }
        }

        static void ParseAssetPath(string assetPath, ref string assetBundleName, ref string assetName)
        {
            assetBundleName = assetPath.ToLower();
            assetName = assetPath;
            if (assetPath.Contains("/"))
            {
                assetBundleName = assetPath.Substring(0, assetPath.LastIndexOf("/"));
                assetBundleName = assetBundleName.Replace("/", "_").ToLower();
                assetName = assetPath.Substring(assetPath.LastIndexOf("/") + 1);
            }
        }

        static IEnumerator PreloadAssetBundle(LuaFunction onProgress)
        {
            while (preloadAssetBundleNames.Count > 0)
            {
                string assetBundleName = preloadAssetBundleNames[0];
                preloadAssetBundleNames.RemoveAt(0);
                AssetBundleInfo assetBundleInfo = null;
                loadedAssetBundles.TryGetValue(assetBundleName, out assetBundleInfo);
                if (assetBundleInfo == null)
                {
                    string localUrl = LuaConst.localABPath + "/" + assetBundleName + LuaConst.ExtName;
                    UnityWebRequest request = UnityWebRequestAssetBundle.GetAssetBundle(localUrl);
                    yield return request.SendWebRequest();
                    if (request.error != null)
                    {
                        Debug.LogError(" [ " + localUrl + " ] " + request.error);
                    }
                    AssetBundle assetBundle = (request.downloadHandler as DownloadHandlerAssetBundle).assetBundle;
                    assetBundleInfo = new AssetBundleInfo(assetBundle);
                    loadedAssetBundles.Add(assetBundleName, assetBundleInfo);
                }
                if (onProgress != null) onProgress.Call((totalPreloadAssetBundles - preloadAssetBundleNames.Count) / (float)totalPreloadAssetBundles);
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