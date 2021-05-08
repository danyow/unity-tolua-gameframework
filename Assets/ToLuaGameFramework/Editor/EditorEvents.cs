using UnityEditor;
using UnityEditor.Build;
using UnityEditor.Build.Reporting;
namespace ToLuaGameFramework
{
    public class EditorEvents : IPreprocessBuild
    {
        public int callbackOrder => 0;

        public void OnPreprocessBuild(BuildTarget target, string path)
        {
            if (!Config.UseAssetBundle && !Config.LuaDevPath.Contains("Resources"))
            {
                string msg = "当前Config.UseAssetBundle为False，且Lua资源不在Resources目录下，打包后将无法读取。";
                if (!EditorUtility.DisplayDialog("提示", msg, "仍然打包", "取消打包"))
                {
                    throw new System.Exception("User Cancelled Build");
                }
            }
        }
    }
}