using System;
using System.Text;
using System.Security.Cryptography;
using System.IO;

namespace ToLuaGameFramework
{
    public class LAES
    {
        private static string Key
        {
            get { return @"fANqOtuGLXmeKRz0dVctf25fI7wo4o40"; }
        }

        private static string IV
        {
            get { return @"7MAIlToRV5uGDB40"; }
        }

        /// <summary>
        /// AES加密
        /// </summary>
        public static string Encrypt(string content, string key = null, string iv = null)
        {
            if (content == null) return null;

            if (key == null) key = Key;
            if (iv == null) iv = IV;
            byte[] bKey = Encoding.UTF8.GetBytes(key);
            byte[] bIV = Encoding.UTF8.GetBytes(iv);
            byte[] byteArray = Encoding.UTF8.GetBytes(content);

            string encrypt = null;
            Rijndael aes = Rijndael.Create();
            try
            {
                // 开辟一块内存流 
                using (MemoryStream mStream = new MemoryStream())
                {
                    // 把内存流对象包装成加密流对象  
                    using (CryptoStream cStream = new CryptoStream(mStream, aes.CreateEncryptor(bKey, bIV), CryptoStreamMode.Write))
                    {
                        // 明文数据写入加密流  
                        cStream.Write(byteArray, 0, byteArray.Length);
                        cStream.FlushFinalBlock();
                        encrypt = Convert.ToBase64String(mStream.ToArray());
                    }
                }
            }
            catch { }
            aes.Clear();

            return encrypt;
        }

        /// <summary>
        /// AES解密
        /// </summary>
        public static string Decrypt(string content, string key = null, string iv = null)
        {
            if (content == null) return null;

            if (key == null) key = Key;
            if (iv == null) iv = IV;
            byte[] bKey = Encoding.UTF8.GetBytes(key);
            byte[] bIV = Encoding.UTF8.GetBytes(iv);
            byte[] byteArray = Convert.FromBase64String(content);

            string decrypt = null;
            Rijndael aes = Rijndael.Create();
            try
            {
                // 开辟一块内存流，存储密文  
                using (MemoryStream mStream = new MemoryStream())
                {
                    // 把内存流对象包装成加密流对象  
                    using (CryptoStream cStream = new CryptoStream(mStream, aes.CreateDecryptor(bKey, bIV), CryptoStreamMode.Write))
                    {
                        // 明文存储区
                        cStream.Write(byteArray, 0, byteArray.Length);
                        cStream.FlushFinalBlock();
                        decrypt = Encoding.UTF8.GetString(mStream.ToArray());
                    }
                }
            }
            catch { }
            aes.Clear();

            return decrypt;
        }
    }
}
