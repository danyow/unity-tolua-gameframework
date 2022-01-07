using UnityEditor;
using UnityEngine;
using System.IO;
using System.Collections.Generic;
using System.Diagnostics;

namespace ToLuaGameFramework
{
    public class Packager
    {
        public static string platform = string.Empty;
        static List<AssetBundleBuild> maps = new List<AssetBundleBuild>();

        ///iOS///////////////////////////////////////////////////////////////////////////////////////////

        [MenuItem("ToLuaGameFramework/Build IOS AssetBundle", false, 100)]
        public static void BuildiPhoneResource()
        {
            BuildAssetResource(BuildTarget.iOS);
        }

        ///Andoird///////////////////////////////////////////////////////////////////////////////////////////

        [MenuItem("ToLuaGameFramework/Build Android AssetBundle", false, 100)]
        public static void BuildAndroidResourceAll()
        {
            BuildAssetResource(BuildTarget.Android);
        }

        ///Windows///////////////////////////////////////////////////////////////////////////////////////////

        [MenuItem("ToLuaGameFramework/Build Windows AssetBundle", false, 100)]
        public static void BuildWindowsResource()
        {
            BuildAssetResource(BuildTarget.StandaloneWindows);
        }

        /// <summary>
        /// 生成绑定素材(mode:0全部导出 1导出lua脚本 2导出资源)
        /// </summary>
        public static void BuildAssetResource(BuildTarget target)
        {
            string outputPath = null;
            if (target == BuildTarget.Android)
            {
                outputPath = LuaConfig.OutputPath_Android;
            }
            else if (target == BuildTarget.iOS)
            {
                outputPath = LuaConfig.OutputPath_IOS;
            }
            else
            {
                outputPath = LuaConfig.OutputPath_PC;
            }
            if (outputPath.EndsWith("/lua"))
            {
                EditorUtility.DisplayDialog("提示", "导出目录(" + outputPath + ")不能用lua命名", "确定");
                return;
            }
            if (Directory.Exists(outputPath))
            {
                //清除旧文件
                string[] folders = Directory.GetDirectories(outputPath);
                for (int i = 0; i < folders.Length; i++)
                {
                    Directory.Delete(folders[i], true);
                }
                string[] files = Directory.GetFiles(outputPath);
                for (int i = 0; i < files.Length; i++)
                {
                    File.Delete(files[i]);
                }
            }
            else
            {
                Directory.CreateDirectory(outputPath);
            }
            AssetDatabase.Refresh();

            maps.Clear();

            string tempDir = Application.dataPath + "/temp";

            HandleLuaBundle(tempDir);
            HandleResBundle(LuaConfig.ExportRes_For_Startup, LuaConfig.ExportRes_For_Delay);
            HandleResBundle(LuaConfig.ExportRes_For_Delay);

            AssetDatabase.Refresh();
            BuildPipeline.BuildAssetBundles(outputPath, maps.ToArray(), BuildAssetBundleOptions.None, target);
            ClearUnuseFiles(outputPath);

            BuildFileIndex(outputPath);
            AssetDatabase.DeleteAsset(tempDir.Replace(Application.dataPath, "Assets"));
            AssetDatabase.Refresh();

            UnityEngine.Debug.Log("AssetBundle已导出到" + outputPath);
            Application.OpenURL(outputPath);
        }

        /// <summary>
        /// 处理Lua的AssetBundle
        /// </summary>
        static void HandleLuaBundle(string tempDir)
        {
            if (!Directory.Exists(tempDir)) Directory.CreateDirectory(tempDir);

            List<string> srcDirs = new List<string>(LuaConfig.ExportLuaPaths);
            srcDirs.Add(LuaConst.luaDir);
            srcDirs.Add(LuaConst.toluaDir);
            //LuaDev
            for (int i = 0; i < srcDirs.Count; i++)
            {
                if (LuaConst.LuaByteMode)
                {
                    string sourceDir = srcDirs[i];
                    if (!sourceDir.StartsWith(Application.dataPath)) sourceDir = Application.dataPath + "/" + sourceDir;
                    string[] files = Directory.GetFiles(sourceDir, "*.lua", SearchOption.AllDirectories);
                    int len = sourceDir.Length;

                    if (sourceDir[len - 1] == '/' || sourceDir[len - 1] == '\\')
                    {
                        --len;
                    }
                    for (int j = 0; j < files.Length; j++)
                    {
                        string str = files[j].Remove(0, len);
                        string dest = tempDir + str + ".bytes";
                        string dir = Path.GetDirectoryName(dest);
                        Directory.CreateDirectory(dir);
                        EncodeLuaFile(files[j], dest);
                    }
                }
                else
                {
                    string sourceDir = srcDirs[i];
                    if (!sourceDir.StartsWith(Application.dataPath)) sourceDir = Application.dataPath + "/" + sourceDir;
                    ToLuaMenu.CopyLuaBytesFiles(sourceDir, tempDir);
                }
            }
            string[] filePaths = Directory.GetFiles(tempDir, "*.bytes", SearchOption.AllDirectories);
            List<string> assetNames = new List<string>();
            for (int i = 0; i < filePaths.Length; i++)
            {
                string filePath = filePaths[i].Replace("\\", "/").Replace(Application.dataPath, "Assets");
                assetNames.Add(filePath);
            }
            AssetBundleBuild build = new AssetBundleBuild();
            build.assetBundleName = "lua" + LuaConst.ExtName;
            build.assetNames = assetNames.ToArray();
            maps.Add(build);
        }

        /// <summary>
        /// 处理Res的AssetBundle
        /// </summary>
        static void HandleResBundle(Dictionary<string, string> resDic, Dictionary<string, string> excludeList = null)
        {
            foreach (var path in resDic.Values)
            {
                string resPath = "Assets/" + LuaConfig.LuaDevPath + "/" + path;
                List<string> resPaths = new List<string>();
                string[] files = Directory.GetFiles(resPath, "*", SearchOption.AllDirectories);
                for (int i = 0; i < files.Length; i++)
                {
                    string file = files[i].Replace("\\", "/");
                    if (!file.EndsWith(".meta"))
                    {
                        bool isExclude = false;
                        if (excludeList != null)
                        {
                            foreach (var item in excludeList)
                            {
                                if (file.Replace("Assets/" + LuaConfig.LuaDevPath + "/", "").StartsWith(item.Value))
                                {
                                    isExclude = true;
                                    break;
                                }
                            }
                        }
                        if (isExclude) continue;
                        resPaths.Add(file);
                    }
                }
                string abName = GetResNameFromPath(resPath);
                AssetBundleBuild build = new AssetBundleBuild();
                build.assetBundleName = abName + LuaConst.ExtName;
                build.assetNames = resPaths.ToArray();
                maps.Add(build);
            }
        }

        static string GetResNameFromPath(string resPath)
        {
            if (resPath.StartsWith("Assets"))
            {
                resPath = resPath.Replace("Assets/" + LuaConfig.LuaDevPath + "/", "");
            }
            else
            {
                resPath = resPath.Replace(Application.dataPath + "/" + LuaConfig.LuaDevPath + "/", "");
            }
            resPath = resPath.Replace("\\", "_").Replace("/", "_");
            return resPath;
        }

        /// <summary>
        /// 清除.manifest,.meta,.DS_Store等无用文件
        /// </summary>
        static void ClearUnuseFiles(string outputPath)
        {
            List<string> paths = new List<string>();
            paths.AddRange(Directory.GetFiles(outputPath, "*.manifest", SearchOption.AllDirectories));
            paths.AddRange(Directory.GetFiles(outputPath, "*.meta", SearchOption.AllDirectories));
            paths.AddRange(Directory.GetFiles(outputPath, "*.DS_Store", SearchOption.AllDirectories));
            for (int i = 0; i < paths.Count; i++)
            {
                File.Delete(paths[i]);
            }
            string rootFileName = outputPath.Substring(outputPath.LastIndexOf("/"));
            string rootFilePath = outputPath + rootFileName;
            if (File.Exists(rootFilePath))
            {
                File.Delete(rootFilePath);
            }
            if (File.Exists(rootFilePath + ".manifest"))
            {
                File.Delete(rootFilePath + ".manifest");
            }
        }

        /// <summary>
        /// 创建资源MD5列表，以便检查更新
        /// </summary>
        static void BuildFileIndex(string outputPath)
        {
            string resPath = outputPath;
            string newFilePath = resPath + "/" + LuaConst.MD5FileName;
            if (File.Exists(newFilePath)) File.Delete(newFilePath);

            FileStream fs = new FileStream(newFilePath, FileMode.CreateNew);
            StreamWriter sw = new StreamWriter(fs);
            //lua.zip文件
            string fileName = "lua" + LuaConst.ExtName;
            string filePath = outputPath + "/" + fileName;
            if (File.Exists(filePath))
            {
                string md5 = LUtils.MD5file(filePath);
                sw.WriteLine("0|动态|" + fileName + "|" + md5);
            }
            //自动下载的资源
            foreach (var path in LuaConfig.ExportRes_For_Startup)
            {
                fileName = path.Value + LuaConst.ExtName;
                fileName = fileName.Replace("\\", "_").Replace("/", "_").ToLower();
                filePath = outputPath + "/" + fileName;
                if (File.Exists(filePath))
                {
                    string md5 = LUtils.MD5file(filePath);
                    sw.WriteLine("0|" + path.Key + "|" + fileName + "|" + md5);
                }
            }
            //延迟下载的资源
            foreach (var path in LuaConfig.ExportRes_For_Delay)
            {
                fileName = path.Value + LuaConst.ExtName;
                fileName = fileName.Replace("\\", "_").Replace("/", "_").ToLower();
                filePath = outputPath + "/" + fileName;
                if (File.Exists(filePath))
                {
                    string md5 = LUtils.MD5file(filePath);
                    sw.WriteLine("1|" + path.Key + "|" + fileName + "|" + md5);
                }
            }
            sw.Close();
            fs.Close();
        }

        public static void EncodeLuaFile(string srcFile, string outFile)
        {
            if (!srcFile.ToLower().EndsWith(".lua"))
            {
                File.Copy(srcFile, outFile, true);
                return;
            }
            bool isWin = true;
            string luaexe = string.Empty;
            string args = string.Empty;
            string exedir = string.Empty;
            string currDir = Directory.GetCurrentDirectory();
            if (Application.platform == RuntimePlatform.WindowsEditor)
            {
                isWin = true;
                luaexe = "luajit.exe";
                args = "-b -g " + srcFile + " " + outFile;
                exedir = LuaConst.frameworkRoot + "/LuaEncoder/luajit/";
            }
            else if (Application.platform == RuntimePlatform.OSXEditor)
            {
                isWin = false;
                luaexe = "./luajit";
                args = "-b -g " + srcFile + " " + outFile;
                exedir = LuaConst.frameworkRoot + "/LuaEncoder/luajit_mac/";
            }
            Directory.SetCurrentDirectory(exedir);
            ProcessStartInfo info = new ProcessStartInfo();
            info.FileName = luaexe;
            info.Arguments = args;
            info.WindowStyle = ProcessWindowStyle.Hidden;
            info.UseShellExecute = isWin;
            info.ErrorDialog = true;

            Process pro = Process.Start(info);
            pro.WaitForExit();
            Directory.SetCurrentDirectory(currDir);
        }

    }
}