using UnityEngine;

namespace ToLuaGameFramework
{
    /// <summary>
    /// 项目配置
    /// </summary>
    public class Config : MonoBehaviour
    {
        /// <summary>
        /// 是否使用AssetBundle,开发时使用本地Resources目录，写完代码直接启动测试
        /// </summary>
        public readonly static bool UseAssetBundle = true;

        /// <summary>
        /// 开发专用目录，如果导出游戏又临时不使用热更模式的，需配置到Resources目录
        /// </summary>
        public readonly static string LuaDevPath = Application.dataPath + "/LuaDev";

        /// <summary>
        /// 导出AB包的路径，导出后资源从该目录上传到远程服务器，并本地清除，切勿留着导入包内，建议定义在工程目录外，如"E:/ExportAssetBundles"
        /// </summary>
        public readonly static string OutputPath = Application.streamingAssetsPath + "/LuaExport";

        /// <summary>
        /// 远程服务器上AB资源网址(如：http://xxx.xxx.xxx.xxx:8081/res)
        /// (若是streamingAssetsPath，因为使用UnityWebRequest，所以无需加头部file://,否则反而读取失败)
        /// </summary>
        public readonly static string RemoteUrl = OutputPath;
        //public readonly static string RemoteUrl = Client.Common.UrlConfig.SERVER_RES_URL + "/Lua";

        /// <summary>
        /// 需要导出AssetBundle的Lua代码目录
        /// </summary>
        public static string[] ExportLuaPaths =
        {
            //Framework
            LuaConst.luaDir,
            LuaConst.toluaDir,
            //Game
            LuaDevPath + "/Lua"
        };

        /// <summary>
        /// 需要导出AssetBundle的所有Prefabs目录
        /// </summary>
        public static string ExportResPath = LuaDevPath + "/Prefabs";

    }
}