using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace ToLuaGameFramework
{
    public class LMD5
    {

        public static string StirngToMD5(string inputStr, bool upperCase = false)
        {
            byte[] inputBytes = Encoding.UTF8.GetBytes(inputStr);
            return BytesToMD5(inputBytes, upperCase);
        }

        public static string BytesToMD5(byte[] inputBytes, bool upperCase = false)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] hash = md5.ComputeHash(inputBytes);
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < hash.Length; i++)
            {
                if (upperCase)
                {
                    sb.Append(hash[i].ToString("X2"));//字母大写
                }
                else
                {
                    sb.Append(hash[i].ToString("x2"));//字母小写
                }
            }
            return sb.ToString();
        }

        /// <summary>
        /// 获取文件的MD5
        /// </summary>
        public static string FileToMD5(string filePath, bool upperCase = false)
        {
            FileStream file = new FileStream(filePath, FileMode.Open);
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] retVal = md5.ComputeHash(file);
            file.Close();
            StringBuilder sb = new StringBuilder();
            foreach (byte t in retVal)
            {
                if (upperCase)
                {
                    sb.Append(t.ToString("X2"));//字母大写
                }
                else
                {
                    sb.Append(t.ToString("x2"));//字母小写
                }
            }
            return sb.ToString();
        }
    }
}