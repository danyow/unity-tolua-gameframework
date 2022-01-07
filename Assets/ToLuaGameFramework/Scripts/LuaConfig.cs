using UnityEngine;
using System.Collections.Generic;

namespace ToLuaGameFramework
{
    /// <summary>
    /// 项目配置
    /// </summary>
    public class LuaConfig : MonoBehaviour
    {
        /// <summary>
        /// Lua脚本是否使用AssetBundle,开发时使用本地LuaDev/Lua目录，写完代码直接启动测试
        /// </summary>
        public readonly static bool IsLuaUseBundle = !Application.isEditor || true;

        /// <summary>
        /// 资源是否使用AssetBundle
        /// </summary>
        public readonly static bool IsResUseBundle = !Application.isEditor || true;

        /// <summary>
        /// 开发专用目录（Lua脚本和预制体，声音所在目录）
        /// </summary>
        public readonly static string LuaDevPath = "LuaDev";

        /// <summary>
        /// 导出AB包的路径，导出后资源从该目录上传到远程服务器，并本地清除，切勿留着导入包内，建议定义在工程目录外，如"E:/ExportAssetBundles"
        /// </summary>
        public readonly static string OutputPath_Android = "C:/MyFileAudit/lua_res_android";
        public readonly static string OutputPath_IOS = "C:/MyFileAudit/lua_res_ios";
        public readonly static string OutputPath_PC = "C:/MyFileAudit/lua_res_pc";

        /// <summary>
        /// 远程服务器上AB资源网址(如：http://xxx.xxx.xxx.xxx:8081/res)
        /// (若临时放在StreamingAssets目录，使用UnityWebRequest时，无需加头部file://,否则反而读取失败)
        /// </summary>
        public readonly static string RemoteUrl = OutputPath_PC;
        //public static string RemoteUrl { get { return Client.Common.UrlConfig.LUA_RES_URL; } }

        /// <summary>
        /// 需要导出AssetBundle的Lua代码目录
        /// </summary>
        public static string[] ExportLuaPaths =
        {
            LuaDevPath + "/Lua"
        };

        /// <summary>
        /// 需要导出AssetBundle的资源目录(游戏启动就必须下载)
        /// </summary>
        public static Dictionary<string, string> ExportRes_For_Startup = new Dictionary<string, string>()
        {
            { "通用", "Prefabs"}
        };

        /// <summary>
        /// 需要导出AssetBundle的资源目录(打开模块前才独立下载)
        /// </summary>
        public static Dictionary<string, string> ExportRes_For_Delay = new Dictionary<string, string>()
        {
            { "每日奖励", "Prefabs/Activities/DailyReward"}
        };

    }
}