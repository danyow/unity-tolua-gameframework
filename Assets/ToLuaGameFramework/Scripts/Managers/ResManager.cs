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
        public static Dictionary<string, string> localFiles = new Dictionary<string, string>();
        Dictionary<string, string> loadSuccessFiles = new Dictionary<string, string>();
        static Dictionary<string, AssetBundleInfo> loadedAssetBundles = new Dictionary<string, AssetBundleInfo>();
        static List<string> preloadAssetBundleNames = new List<string>();
        static int totalPreloadAssetBundles;

        void Awake()
        {
            instance = this;
        }

        /// <summary>
        /// 开始增量更新远程资源
        /// </summary>
        /// <returns></returns>
        public void UpdateRemoteAssetBundle()
        {
            if (Config.UseAssetBundle)
            {
                Debug.Log("开始下载资源");
                StartCoroutine(CheckAndDownloadAssetBundle());
            }
            else
            {
                LuaManager.instance.StartLua();
            }
        }

        #region 加载远程AssetBundle

        /// <summary>
        /// 启动更新下载，这里只是个思路演示，此处可启动线程下载更新
        /// </summary>
        IEnumerator CheckAndDownloadAssetBundle()
        {
            //读取本地MD5文件
            localFiles = new Dictionary<string, string>();
            string localFilesPath = LuaConst.localABPath + "/" + LuaConst.MD5FileName;
            Debug.Log("localFilesPath: " + localFilesPath);
            if (File.Exists(localFilesPath))
            {
                localFiles = ParseKeyValue(File.ReadAllText(localFilesPath));
            }
            //下载远程MD5文件
            string filesUrl = Config.RemoteUrl + "/" + LuaConst.MD5FileName;
            UnityWebRequest request = UnityWebRequest.Get(filesUrl);
            yield return request.SendWebRequest();
            if (request.error != null)
            {
                Debug.LogError("[ " + filesUrl + " ]" + request.error);
                yield break;
            }
            if (!Directory.Exists(LuaConst.localABPath)) Directory.CreateDirectory(LuaConst.localABPath);
            Dictionary<string, string> newestFiles = ParseKeyValue(request.downloadHandler.text);
            Dictionary<string, string> reloadFiles = new Dictionary<string, string>();
            foreach (var item in newestFiles)
            {
                bool localHaveKey = localFiles.ContainsKey(item.Key);
                if (!localHaveKey)
                {
                    //是新的文件，加入加载
                    if (item.Key.EndsWith(LuaConst.ExtName)) reloadFiles.Add(item.Key, item.Value);
                }
                else
                {
                    bool fileExists = File.Exists(LuaConst.localABPath + "/" + item.Key);
                    if (!fileExists)
                    {
                        //本地找不到，加入下载
                        if (item.Key.EndsWith(LuaConst.ExtName)) reloadFiles.Add(item.Key, item.Value);
                    }
                    else
                    {
                        string localHash = localFiles[item.Key];
                        string remoteHash = newestFiles[item.Key];
                        bool md5Match = localHash.Equals(remoteHash);
                        if (!md5Match)
                        {
                            //文件有改动，加入下载
                            if (item.Key.EndsWith(LuaConst.ExtName)) reloadFiles.Add(item.Key, item.Value);
                        }
                    }
                }
            }
            int maxCount = reloadFiles.Count;
            Debug.Log("下载资源数量：" + maxCount);
            if (maxCount > 0)
            {
                MessageCenter.Dispatch(MsgEnum.ABLoadingBegin);
                MessageCenter.Dispatch(MsgEnum.ABLoadingProgress, 0);
            }
            int loadedCount = 0;
            foreach (var item in reloadFiles)
            {
                string url = Config.RemoteUrl + "/" + item.Key;
                if (!item.Key.Contains(".")) continue;
                Debug.Log("下载资源：" + url);
                UnityWebRequest resRequest = UnityWebRequest.Get(url);
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
                loadSuccessFiles.Add(item.Key, item.Value);
                loadedCount++;
                float progress = loadedCount / (float)maxCount;
                Debug.Log("下载进度：" + loadedCount + " / " + maxCount + " = " + progress);
                MessageCenter.Dispatch(MsgEnum.ABLoadingProgress, progress);
                if (loadedCount == maxCount)
                {
                    MessageCenter.Dispatch(MsgEnum.ABLoadingFinish);
                }
            }
            UpdateLocalFiles();
            yield return new WaitForEndOfFrame();
            LuaManager.instance.StartLua();
        }

        #endregion

        #region 预加载本地AssetBundle

        /// <summary>
        /// Lua调用,预加载AssetBundle列表，传入目录路径
        /// </summary>
        public static void PreloadLocalAssetBundles(string[] assetBundlePaths, LuaFunction onProgress)
        {
            if (!Config.UseAssetBundle)
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
                    namePrefix = "res/" + path.Replace("/", "_").ToLower();
                }
                else
                {
                    namePrefix = "res/" + path.ToLower();
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

        #region 对外方法

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
            if (Config.UseAssetBundle)
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
                if (Config.LuaDevPath.Contains(resourcesTag))
                {
                    string prefabFullPath = Config.LuaDevPath + "/" + prefabPath;
                    prefabFullPath = prefabFullPath.Substring(prefabFullPath.IndexOf(resourcesTag) + resourcesTag.Length + 1);
                    prefab = Resources.Load<GameObject>(prefabFullPath);
                }
                else
                {
#if UNITY_EDITOR
                    string prefabFullPath = Config.LuaDevPath + "/" + prefabPath + ".prefab";
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
            if (Config.UseAssetBundle)
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
                if (Config.LuaDevPath.Contains(resourcesTag))
                {
                    string prefabFullPath = Config.LuaDevPath + "/" + prefabPath;
                    prefabFullPath = prefabFullPath.Substring(prefabFullPath.IndexOf(resourcesTag) + resourcesTag.Length + 1);
                    prefab = Resources.Load<GameObject>(prefabFullPath);
                }
                else
                {
#if UNITY_EDITOR
                    string prefabFullPath = Config.LuaDevPath + "/" + prefabPath + ".prefab";
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
            if (Config.UseAssetBundle)
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
                if (Config.LuaDevPath.Contains(resourcesTag))
                {
                    string prefabFullPath = Config.LuaDevPath + "/" + assetPath;
                    prefabFullPath = prefabFullPath.Substring(prefabFullPath.IndexOf(resourcesTag) + resourcesTag.Length + 1);
                    asset = Resources.Load<T>(prefabFullPath);
                }
                else
                {
#if UNITY_EDITOR
                    string prefabFullPath = AddSuffix(Config.LuaDevPath + "/" + assetPath);
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
            if (Config.UseAssetBundle)
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
                if (Config.LuaDevPath.Contains(resourcesTag))
                {
                    string prefabFullPath = Config.LuaDevPath + "/" + assetPath;
                    prefabFullPath = prefabFullPath.Substring(prefabFullPath.IndexOf(resourcesTag) + resourcesTag.Length + 1);
                    asset = Resources.Load<T>(prefabFullPath);
                }
                else
                {
#if UNITY_EDITOR
                    string prefabFullPath = AddSuffix(Config.LuaDevPath + "/" + assetPath);
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
            assetBundleName = "res/" + assetPath.ToLower();
            assetName = assetPath;
            if (assetPath.Contains("/"))
            {
                assetBundleName = assetPath.Substring(0, assetPath.LastIndexOf("/"));
                assetBundleName = "res/" + assetBundleName.Replace("/", "_").ToLower();
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

        Dictionary<string, string> ParseKeyValue(string filesContent)
        {
            Dictionary<string, string> list = new Dictionary<string, string>();
            try
            {
                string[] files = filesContent.Split('\n');
                for (int i = 0; i < files.Length; i++)
                {
                    if (string.IsNullOrEmpty(files[i])) continue;
                    string[] keyValue = files[i].Split('|');
                    string key = keyValue[0];
                    string value = keyValue[1].Replace("\n", "").Trim();
                    list.Add(key, value);
                }
            }
            catch (Exception e)
            {
                Debug.LogError(e);
            }
            return list;
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
                stringBuilder.Append(item.Key + "|" + item.Value + "\n");
            }
            File.WriteAllText(LuaConst.localABPath + "/" + LuaConst.MD5FileName, stringBuilder.ToString());
        }
        #endregion
    }

}