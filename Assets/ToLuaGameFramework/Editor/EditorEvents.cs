using UnityEditor;
using UnityEditor.Build;
using UnityEditor.Build.Reporting;

namespace ToLuaGameFramework
{
    public class EditorEvents : IPreprocessBuildWithReport
    {
        public int callbackOrder => 0;

        //打包前触发
        public void OnPreprocessBuild(BuildReport report)
        {
            if (!Config.UseAssetBundle)
            {
                EditorUtility.DisplayDialog("提示", "当前Config.UseAssetBundle为False，如果LuaDev没有在Resources里，打包后将无法读取Lua资源。", "知道了");

                /*
                if (!EditorUtility.DisplayDialog("提示", "当前Config.UseAssetBundle为False，如果LuaDev没有在Resources里，打包后将无法读取Lua资源。", "仍然打包", "取消打包"))
                {
                    //TODO:实现取消打包
                }
                */
            }
        }
    }
}