using UnityEngine;
using System.Collections;
using LuaInterface;
using UnityEngine.Networking;
using System.Net;
using System.IO;
using System;

namespace ToLuaGameFramework
{
    public class HttpManager : MonoBehaviour
    {
        public static HttpManager instance;

        void Awake()
        {
            instance = this;
        }

        /// <summary>
        /// 同步
        /// </summary>
        public static string Get(string url)
        {
            if (url.Contains("?"))
            {
                url += "&rand=" + DateTime.Now.Ticks;
            }
            else
            {
                url += "?rand=" + DateTime.Now.Ticks;
            }
            string responseData = null;
            HttpWebRequest webRequest = WebRequest.Create(url) as HttpWebRequest;
            webRequest.Method = "GET";
            webRequest.ServicePoint.Expect100Continue = false;
            webRequest.Timeout = 5000;
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
            if (url.Contains("?"))
            {
                url += "&rand=" + DateTime.Now.Ticks;
            }
            else
            {
                url += "?rand=" + DateTime.Now.Ticks;
            }
            UnityWebRequest request = UnityWebRequest.Get(url);
            yield return request.SendWebRequest();
            if (request.error != null)
            {
                Debug.LogError("Http Get Fail: " + request.error);
                callback.Call("");
                yield break;
            }
            callback.Call(request.downloadHandler.text);
        }

        /// <summary>
        /// 同步
        /// </summary>
        public static string Post(string url, LuaTable data, string dataType = null)
        {
            if (url.Contains("?"))
            {
                url += "&rand=" + DateTime.Now.Ticks;
            }
            else
            {
                url += "?rand=" + DateTime.Now.Ticks;
            }
            HttpWebRequest webRequest = WebRequest.Create(url) as HttpWebRequest;
            webRequest.Method = "POST";
            string args = "";
            if (!string.IsNullOrEmpty(dataType) && dataType.ToLower().Contains("json"))
            {
                webRequest.ContentType = "application/json;charset=utf-8";
                args = "{";
                foreach (var item in data.ToDictTable<string, string>())
                {
                    if (!args.Equals("{"))
                    {
                        args += ",";
                    }
                    args += "\"" + item.Key + "\":\"" + item.Value + "\"";
                }
                args += "}";
            }
            else
            {
                webRequest.ContentType = "application/x-www-form-urlencoded;charset=utf-8";
                foreach (var item in data.ToDictTable<string, string>())
                {
                    if (args != "")
                    {
                        args += "&";
                    }
                    args += item.Key + "=" + item.Value;
                }
            }
            webRequest.ServicePoint.Expect100Continue = false;
            webRequest.Timeout = 5000;
            StreamWriter requestWriter = null;
            StreamReader responseReader = null;
            string responseData = null;
            try
            {
                requestWriter = new StreamWriter(webRequest.GetRequestStream());
                requestWriter.Write(args);
                requestWriter.Close();
                requestWriter = null;
                responseReader = new StreamReader(webRequest.GetResponse().GetResponseStream());
                responseData = responseReader.ReadToEnd();
            }
            catch (Exception e)
            {
                Debug.LogError(e);
            }
            finally
            {
                if (requestWriter != null)
                {
                    requestWriter.Close();
                }
                if (responseReader != null)
                {
                    responseReader.Close();
                }
                webRequest.GetResponse().GetResponseStream().Close();
            }
            return responseData;
        }

        /// <summary>
        /// 异步
        /// </summary>
        public static void Post(string url, LuaTable data, LuaFunction callback, string dataType = null)
        {
            instance.StartCoroutine(PostDo(url, data, callback, dataType));
        }

        static IEnumerator PostDo(string url, LuaTable data, LuaFunction callback, string dataType)
        {
            if (url.Contains("?"))
            {
                url += "&rand=" + DateTime.Now.Ticks;
            }
            else
            {
                url += "?rand=" + DateTime.Now.Ticks;
            }
            string contentType = null;
            string args = "";
            if (!string.IsNullOrEmpty(dataType) && dataType.ToLower().Contains("json"))
            {
                contentType = "application/json;charset=utf-8";
                args = "{";
                foreach (var item in data.ToDictTable<string, string>())
                {
                    if (!args.Equals("{")) args += ",";
                    args += "\"" + item.Key + "\":\"" + item.Value + "\"";
                }
                args += "}";
            }
            else
            {
                contentType = "application/x-www-form-urlencoded;charset=utf-8";
                foreach (var item in data.ToDictTable<string, string>())
                {
                    if (args != "") args += "&";
                    args += item.Key + "=" + item.Value;
                }
            }
            UnityWebRequest request = UnityWebRequest.Post(url, args);
            request.SetRequestHeader("Content-Type", contentType);
            yield return request.SendWebRequest();
            if (request.error != null)
            {
                Debug.LogError("Http POST Fail: " + request.error);
                callback.Call("");
                yield break;
            }
            callback.Call(request.downloadHandler.text);
        }

        public static string UrlEncode(string str)
        {
            return UnityWebRequest.EscapeURL(str);
        }

        public static string UrlDecode(string str)
        {
            return UnityWebRequest.UnEscapeURL(str);
        }
    }
}