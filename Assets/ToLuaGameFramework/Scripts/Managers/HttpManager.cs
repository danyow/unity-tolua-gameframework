using UnityEngine;
using System.Collections;
using LuaInterface;
using UnityEngine.Networking;
using System.Net;
using System.IO;

namespace ToLuaGameFramework
{
    public class HttpManager : MonoBehaviour, ICommand
    {
        public static HttpManager instance;

        void Awake()
        {
            instance = this;
        }
        public bool ExeCommand(CommandEnum command)
        {
            return false;
        }

        /// <summary>
        /// 同步
        /// </summary>
        public static string Get(string url)
        {
            string responseData = null;
            HttpWebRequest webRequest = WebRequest.Create(url) as HttpWebRequest;
            webRequest.Method = "GET";
            webRequest.ServicePoint.Expect100Continue = false;
            webRequest.Timeout = 20000;
            StreamReader responseReader = null;
            try
            {
                responseReader = new StreamReader(webRequest.GetResponse().GetResponseStream());
                responseData = responseReader.ReadToEnd();
            }
            catch
            {
            }
            finally
            {
                webRequest.GetResponse().GetResponseStream().Close();
                responseReader.Close();
                responseReader = null;
                webRequest = null;
            }
            return responseData;
        }

        /// <summary>
        /// 异步
        /// </summary>
        public static void Get(string url, LuaFunction callback)
        {
            instance.StartCoroutine(GetDo(url, callback));
        }

        static IEnumerator GetDo(string url, LuaFunction callback)
        {
            UnityWebRequest request = UnityWebRequest.Get(url);
            yield return request.SendWebRequest();
            if (request.error != null)
            {
                Debug.LogError("Http-Get Fail: " + request.error);
                callback.Call("");
                yield break;
            }
            callback.Call(request.downloadHandler.text);
        }

        /// <summary>
        /// 同步
        /// </summary>
        public static string Post(string url, string args, string dataType)
        {
            StreamWriter requestWriter = null;
            StreamReader responseReader = null;
            string responseData = null;
            HttpWebRequest webRequest = WebRequest.Create(url) as HttpWebRequest;
            webRequest.Method = "POST";
            if (dataType.ToLower().Contains("json"))
            {
                webRequest.ContentType = "application/json";
            }
            else
            {
                webRequest.ContentType = "application/x-www-form-urlencoded";
            }
            webRequest.ServicePoint.Expect100Continue = false;
            webRequest.Timeout = 20000;
            try
            {
                requestWriter = new StreamWriter(webRequest.GetRequestStream());
                requestWriter.Write(args);
                requestWriter.Close();
                requestWriter = null;
                responseReader = new StreamReader(webRequest.GetResponse().GetResponseStream());
                responseData = responseReader.ReadToEnd();
            }
            catch
            {
                throw;
            }
            finally
            {
                if (requestWriter != null)
                {
                    requestWriter.Close();
                    requestWriter = null;
                }
                if (responseReader != null)
                {
                    responseReader.Close();
                    responseReader = null;
                }
                webRequest.GetResponse().GetResponseStream().Close();
                webRequest = null;
            }
            return responseData;
        }

        /// <summary>
        /// 异步
        /// </summary>
        public static void Post(string url, string args, string dataType, LuaFunction callback)
        {
            instance.StartCoroutine(PostDo(url, args, dataType, callback));
        }

        static IEnumerator PostDo(string url, string args, string dataType, LuaFunction callback)
        {
            using (UnityWebRequest request = new UnityWebRequest(url, "POST"))
            {
                byte[] postBytes = System.Text.Encoding.UTF8.GetBytes(args);
                request.uploadHandler = (UploadHandler)new UploadHandlerRaw(postBytes);
                request.downloadHandler = (DownloadHandler)new DownloadHandlerBuffer();
                if (dataType.ToLower().Contains("json"))
                {
                    request.SetRequestHeader("Content-Type", "application/json");
                }
                else
                {
                    request.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                }
                yield return request.SendWebRequest();
                if (request.error != null)
                {
                    Debug.LogError("Http-Post Fail: " + request.error);
                    callback.Call("");
                    yield break;
                }
                callback.Call(request.downloadHandler.text);
            }
        }
    }
}