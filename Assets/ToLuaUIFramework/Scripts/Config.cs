using UnityEngine;

namespace ToLuaUIFramework
{
    /// <summary>
    /// 项目配置
    /// </summary>
    public class Config : MonoBehaviour
    {
        /// <summary>
        /// 是否使用AssetBundle,否则使用本地Resources目录内资源
        /// </summary>
        public const bool UseAssetBundle = false;

        /// <summary>
        /// 开发专用的Resources内的Lua代码目录，方便快速测试Lua代码不用每次都导出AssetBundle，正式发布时需要临时排除
        /// </summary>
        public readonly static string GameResourcesPath = Application.dataPath + "/ExampleGame/Resources";

        /// <summary>
        /// 导出AB包的路径，导出后资源将从该目录拷贝到远程服务器目录
        /// </summary>
        public readonly static string OutputABPath = Application.streamingAssetsPath;

        /// <summary>
        /// 远程服务器上AB资源网址
        /// </summary>
        public readonly static string RemoteABUrl = Application.streamingAssetsPath;

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