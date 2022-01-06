using System;
using System.Collections.Generic;
using UnityEngine;

namespace ToLuaGameFramework
{
    public class BaseMsg : object
    {
        public object[] args;

        public BaseMsg(params object[] args)
        {
            this.args = args;
        }

        public override string ToString()
        {
            string str = GetType().FullName + ": [";
            for (int i = 0; i < args.Length; i++)
            {
                str += args[i] + ",";
            }
            str = str.Substring(0, str.Length - 1);
            str += "]";
            return str;
        }
    }
    public class MessageCenter
    {
        private static Dictionary<MsgEnum, List<Action<BaseMsg>>> eventsBuffer = new Dictionary<MsgEnum, List<Action<BaseMsg>>>();

        /// <summary>
        /// 注册消息监听
        /// </summary>
        public static void Add(MsgEnum msgEnum, Action<BaseMsg> callback)
        {
            if (!eventsBuffer.ContainsKey(msgEnum))
            {
                eventsBuffer.Add(msgEnum, new List<Action<BaseMsg>>());
            }
            List<Action<BaseMsg>> callbacks = eventsBuffer[msgEnum];
            if (!callbacks.Contains(callback))
            {
                callbacks.Add(callback);
            }
        }


        /// <summary>
        /// 注销消息监听
        /// </summary>
        public static void Remove(MsgEnum msgEnum, Action<BaseMsg> callback)
        {
            if (eventsBuffer.ContainsKey(msgEnum))
            {
                List<Action<BaseMsg>> callbacks = eventsBuffer[msgEnum];
                if (callbacks.Contains(callback))
                {
                    callbacks.Remove(callback);
                }
            }
        }

        /// <summary>
        /// 清空所有消息
        /// </summary>
        public static void Remove(MsgEnum msgEnum)
        {
            if (eventsBuffer.ContainsKey(msgEnum))
            {
                eventsBuffer.Remove(msgEnum);
            }
        }

        /// <summary>
        /// 清空所有消息
        /// </summary>
        public static void Clear()
        {
            Debug.Log(">>>>>>>>>>清空所有消息");
            eventsBuffer.Clear();
        }


        /// <summary>
        /// 触发消息
        /// </summary>
        public static void Dispatch(MsgEnum msgEnum, params object[] args)
        {
            Debug.Log("触发消息: " + msgEnum);
            if (eventsBuffer.ContainsKey(msgEnum))
            {
                List<Action<BaseMsg>> callbacks = eventsBuffer[msgEnum];
                for (int i = 0; i < callbacks.Count; i++)
                {
                    if (callbacks[i] != null)
                    {
                        callbacks[i].Invoke(new BaseMsg(args));
                    }
                }
            }
        }

        /// <summary>
        /// 触发消息
        /// </summary>
        public static void Dispatch(MsgEnum msgEnum, BaseMsg msg)
        {
            Debug.Log("触发消息: " + msgEnum);
            if (eventsBuffer.ContainsKey(msgEnum))
            {
                List<Action<BaseMsg>> callbacks = eventsBuffer[msgEnum];
                for (int i = 0; i < callbacks.Count; i++)
                {
                    if (callbacks[i] != null)
                    {
                        callbacks[i].Invoke(msg);
                    }
                }
            }
        }

    }
}