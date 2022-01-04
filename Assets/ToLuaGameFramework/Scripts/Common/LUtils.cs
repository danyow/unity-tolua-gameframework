using LuaInterface;
using System;
using System.Collections.Generic;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

namespace ToLuaGameFramework
{
    /// <summary>
    /// 工具集
    /// </summary>
    public class LUtils
    {
        /// <summary>
        /// 计算字符串的MD5值
        /// </summary>
        public static string MD5(string source)
        {
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            byte[] data = Encoding.UTF8.GetBytes(source);
            byte[] md5Data = md5.ComputeHash(data, 0, data.Length);
            md5.Clear();

            string destString = "";
            for (int i = 0; i < md5Data.Length; i++)
            {
                destString += System.Convert.ToString(md5Data[i], 16).PadLeft(2, '0');
            }
            destString = destString.PadLeft(32, '0');
            return destString;
        }

        /// <summary>
        /// 计算文件的MD5值
        /// </summary>
        public static string MD5file(string file)
        {
            try
            {
                FileStream fs = new FileStream(file, FileMode.Open);
                MD5 md5 = new MD5CryptoServiceProvider();
                byte[] retVal = md5.ComputeHash(fs);
                fs.Close();

                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < retVal.Length; i++)
                {
                    sb.Append(retVal[i].ToString("x2"));
                }
                return sb.ToString();
            }
            catch (Exception ex)
            {
                throw new Exception("md5file() fail, error:" + ex.Message);
            }
        }

        /// <summary>
        /// 枚举转整型
        /// </summary>
        public static int EnumToInt(object _enum)
        {
            return (int)_enum;
        }

        /// <summary>
        /// Lua数组转C#数组
        /// </summary>
        public static T[] LuaArrToArr<T>(LuaTable arr)
        {
            T[] _arr = new T[arr.Length];
            for (int i = 0; i < arr.Length; i++)
            {
                _arr[i] = arr.RawGetIndex<T>(i + 1);
            }
            return _arr;
        }

        /// <summary>
        /// Lua数组转C#List
        /// </summary>
        public static List<T> LuaArrToList<T>(LuaTable arr)
        {
            List<T> _arr = new List<T>();
            for (int i = 0; i < arr.Length; i++)
            {
                _arr.Add(arr.RawGetIndex<T>(i + 1));
            }
            return _arr;
        }

        /// <summary>
        /// 获取鼠标点中的第一个物体
        /// </summary>
        public static GameObject GetTouchFirstHitUIGo()
        {
            if (EventSystem.current)
            {
                PointerEventData eventData = new PointerEventData(EventSystem.current);
                eventData.position = new Vector2(Input.mousePosition.x, Input.mousePosition.y);
                List<RaycastResult> results = new List<RaycastResult>();
                EventSystem.current.RaycastAll(eventData, results);
                if (results.Count > 0)
                {
                    return results[0].gameObject;
                }
            }
            return null;
        }

        private static Vector2 _screenUISize;
        public static Vector2 ScreenUISize
        {
            get
            {
                if (_screenUISize == Vector2.zero)
                {
                    CanvasScaler canvasScaler = GameObject.FindObjectOfType<CanvasScaler>();
                    if (canvasScaler.matchWidthOrHeight > 0.5f)
                    {
                        _screenUISize = new Vector2(canvasScaler.referenceResolution.y * (float)Screen.width / (float)Screen.height, canvasScaler.referenceResolution.y);
                    }
                    else
                    {
                        _screenUISize = new Vector2(canvasScaler.referenceResolution.x, canvasScaler.referenceResolution.x * (float)Screen.height / (float)Screen.width);
                    }
                }
                return _screenUISize;
            }
        }

        /// <summary>
        /// 屏幕转换到UGUI坐标
        /// </summary>
        public static Vector2 ScreenToUGUIPoint(Vector3 screenPosition)
        {
            Vector2 p;
            p.x = ScreenUISize.x * (screenPosition.x - Screen.width * 0.5f) / (float)Screen.width;
            p.y = ScreenUISize.y * (screenPosition.y - Screen.height * 0.5f) / (float)Screen.height;
            return p;
        }

        /// <summary>
        /// UGUI转换到屏幕坐标
        /// </summary>
        public static Vector3 UGUIToScreenPoint(RectTransform rectTransform)
        {
            Vector2 pos = rectTransform.anchoredPosition;
            Transform parent = rectTransform;
            Canvas canvas = parent.GetComponent<Canvas>();
            while (!canvas)
            {
                parent = parent.parent;
                canvas = parent.GetComponent<Canvas>();
                if (!canvas)
                {
                    pos += (parent as RectTransform).anchoredPosition;
                }
            }
            return UGUIToScreenPoint(pos);
        }

        /// <summary>
        /// UGUI转换到屏幕坐标
        /// </summary>
        public static Vector3 UGUIToScreenPoint(Vector2 uiPos)
        {
            Vector3 p;
            p.x = Screen.width * (uiPos.x + ScreenUISize.x * 0.5f) / ScreenUISize.x;
            p.y = Screen.height * (uiPos.y + ScreenUISize.y * 0.5f) / ScreenUISize.y;
            p.z = 0;
            return p;
        }
    }
}
