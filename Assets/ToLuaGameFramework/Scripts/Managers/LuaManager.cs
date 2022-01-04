using LuaInterface;
using System.IO;
using UnityEngine;

namespace ToLuaGameFramework
{
    public class LuaManager : MonoBehaviour
    {
        public static LuaManager instance;

        private LuaState lua;
        private LuaLooper loop = null;

        void Awake()
        {
            instance = this;
            LuaFileUtils.Instance.beZip = LuaConfig.UseAssetBundleLua;
            lua = new LuaState();
            OpenLibs();
            OpenCJson();
            lua.LuaSetTop(0);

            LuaBinder.Bind(lua);
            DelegateFactory.Init();
            LuaCoroutine.Register(lua, this);
        }

        /// <summary>
        /// 初始化加载第三方库
        /// </summary>
        void OpenLibs()
        {
            lua.OpenLibs(LuaDLL.luaopen_pb);
#if UNITY_ANDROID
            lua.OpenLibs(LuaDLL.luaopen_ffi);
#endif
            lua.OpenLibs(LuaDLL.luaopen_bit);
            lua.OpenLibs(LuaDLL.luaopen_struct);
            lua.OpenLibs(LuaDLL.luaopen_lpeg);
            lua.OpenLibs(LuaDLL.luaopen_socket_core);
            lua.OpenLibs(LuaDLL.luaopen_mime_core);
            lua.OpenLibs(LuaDLL.luaopen_cjson);
            lua.OpenLibs(LuaDLL.luaopen_cjson_safe);
        }

        //cjson 比较特殊，只new了一个table，没有注册库，这里注册一下
        void OpenCJson()
        {
            lua.LuaGetField(LuaIndexes.LUA_REGISTRYINDEX, "_LOADED");
            lua.OpenLibs(LuaDLL.luaopen_cjson);
            lua.LuaSetField(-2, "cjson");

            lua.OpenLibs(LuaDLL.luaopen_cjson_safe);
            lua.LuaSetField(-2, "cjson.safe");
        }

        /// <summary>
        /// 启动Lua框架
        /// </summary>
        public void StartLua()
        {
            if (LuaConfig.UseAssetBundleLua)
            {
                InitLuaBundle();
            }
            else
            {
                InitLuaPath();
            }
            lua.Start();
            StartMain();
            StartLooper();
            MessageCenter.Dispatch(MsgEnum.RunLua);
        }

        /// <summary>
        /// 初始化Lua代码加载路径
        /// </summary>
        void InitLuaPath()
        {
            FindAndAddPaths(LuaConfig.LuaDevPath + "/Lua");
        }

        void FindAndAddPaths(string path)
        {
            lua.AddSearchPath(path);
            string[] paths = Directory.GetDirectories(path);
            for (int i = 0; i < paths.Length; i++)
            {
                FindAndAddPaths(paths[i].Replace("\\", "/"));
            }
        }

        /// <summary>
        /// 初始化LuaBundle
        /// </summary>
        void InitLuaBundle()
        {
            string url = LuaConst.localABPath + "/lua" + LuaConst.ExtName;
            if (File.Exists(url))
            {
                AssetBundle bundle = AssetBundle.LoadFromFile(url);
                if (bundle != null)
                {
                    //LuaFileUtils.cs的247行 zipMap.TryGetValue("lua", out zipFile); 全部统一用"lua"做name进行查找
                    LuaFileUtils.Instance.AddSearchBundle("lua", bundle);
                }
            }
            else
            {
                Debug.LogError("本地找不到lua" + LuaConst.ExtName + "文件");
            }
        }

        void StartMain()
        {
            lua.DoFile("Main.lua");

            LuaFunction main = lua.GetFunction("Main");
            main.Call();
            main.Dispose();
            main = null;
        }

        void StartLooper()
        {
            loop = gameObject.AddComponent<LuaLooper>();
            loop.luaState = lua;
        }

        public void DoFile(string filename)
        {
            lua.DoFile(filename);
        }

        /// <summary>
        /// 执行Lua全局方法
        /// </summary>
        public void CallFunction(string funcName)
        {
            lua.GetFunction(funcName).Call();
        }

        /// <summary>
        /// 执行Lua全局方法
        /// </summary>
        public void CallFunction(string funcName, object param)
        {
            lua.GetFunction(funcName).Call(param);
        }

        /// <summary>
        /// 执行Lua全局方法
        /// </summary>
        public void CallFunction(string funcName, object param1, object param2)
        {
            lua.GetFunction(funcName).Call(param1, param2);
        }

        /// <summary>
        /// 执行Lua全局方法
        /// </summary>
        public void CallFunction(string funcName, object param1, object param2, object param3)
        {
            lua.GetFunction(funcName).Call(param1, param2, param3);
        }

        /// <summary>
        /// 执行Lua全局方法
        /// </summary>
        public void CallFunction(string funcName, object param1, object param2, object param3, object param4)
        {
            lua.GetFunction(funcName).Call(param1, param2, param3, param4);
        }

        /// <summary>
        /// 执行Lua全局方法
        /// </summary>
        public void CallFunction(string funcName, object param1, object param2, object param3, object param4, object param5)
        {
            lua.GetFunction(funcName).Call(param1, param2, param3, param4, param5);
        }

        /// <summary>
        /// 获取Lua全局方法
        /// </summary>
        public LuaFunction GetFunction(string funcName)
        {
            return lua.GetFunction(funcName);
        }

        public void LuaGC()
        {
            lua.LuaGC(LuaGCOptions.LUA_GCCOLLECT);
        }

        public void Close()
        {
            loop.Destroy();
            loop = null;

            lua.Dispose();
            lua = null;
        }
    }
}