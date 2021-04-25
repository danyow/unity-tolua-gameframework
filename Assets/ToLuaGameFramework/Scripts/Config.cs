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
        /// 开发专用目录，放在Resources里方便写完代码直接启动测试，正式发布时因为使用外部加载的AB，所以该目录需要临时排除不打入包内
        /// 编辑器测试无需配置到Resources目录里，如果导出游戏又不使用热更模式的，需配置到Resources目录
        /// </summary>
        public readonly static string GameResourcesPath = Application.dataPath + "/LuaDev";

        /// <summary>
        /// 导出AB包的路径，导出后资源从该目录上传到远程服务器，并本地清除，切勿留着导入包内，建议定义在工程目录外，如"E:/ExportAssetBundles"
        /// </summary>
        public readonly static string OutputPath = Application.streamingAssetsPath + "/LuaExport";

        /// <summary>
        /// 远程服务器上AB资源网址(如：http://xxx.xxx.xxx.xxx:8081/res)
        /// </summary>
        public readonly static string RemoteUrl = "file://" + OutputPath;

        /// <summary>
        /// 需要导出AssetBundle的Lua代码目录
        /// </summary>
        public static string[] ExportLuaPaths =
        {
            //Framework
            LuaConst.luaDir,
            LuaConst.toluaDir,
            //Game
            GameResourcesPath + "/Lua"
        };

        /// <summary>
        /// 需要导出AssetBundle的所有Prefabs目录
        /// </summary>
        public static string ExportResPath = GameResourcesPath + "/Prefabs";

    }
}