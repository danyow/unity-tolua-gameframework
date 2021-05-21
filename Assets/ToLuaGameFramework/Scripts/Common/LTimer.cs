using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;

namespace ToLuaGameFramework
{
    public class LTimer : MonoBehaviour
    {
        static List<GameObject> pool = new List<GameObject>();
        Action action;
        float delay, interval, loopTimes;

        public static void Invoke(Action action, float delay, float interval, float loopTimes, string loopID)
        {
            GameObject go = GameObject.Find(TimerID(loopID));
            LTimer timer = null;
            if (go)
            {
                timer = go.GetComponent<LTimer>();
            }
            else
            {
                go = CreateFromPool();
                go.name = TimerID(loopID);
                timer = go.GetComponent<LTimer>();
                if (!timer) timer = go.AddComponent<LTimer>();
            }
            timer.action = action;
            timer.delay = delay;
            timer.interval = interval;
            timer.loopTimes = loopTimes;
            timer.StartCoroutine("Execute");
        }

        public static void InvokeCancel(string loopID)
        {
            if (string.IsNullOrEmpty(loopID)) return;
            GameObject go = GameObject.Find(TimerID(loopID));
            if (go)
            {
                LTimer timer = go.GetComponent<LTimer>();
                timer.action = null;
                go.SetActive(false);
            }
        }

        IEnumerator Execute()
        {
            yield return new WaitForSeconds(delay);
            if (loopTimes < 0)
            {
                while (true)
                {
                    if (action != null) action.Invoke();
                    yield return new WaitForSeconds(interval);
                }
            }
            else if (loopTimes == 0)
            {
                if (action != null)
                {
                    action.Invoke();
                    action = null;
                    gameObject.SetActive(false);
                }
            }
            else
            {
                for (int i = 0; i < loopTimes; i++)
                {
                    if (action != null) action.Invoke();
                    yield return new WaitForSeconds(interval);
                }
                action = null;
                gameObject.SetActive(false);
            }
        }

        static string TimerID(string inputTimerID)
        {
            return "LTimer_" + inputTimerID;
        }

        static GameObject CreateFromPool()
        {
            for (int i = 0; i < pool.Count; i++)
            {
                GameObject go = pool[i];
                if (!go.activeSelf)
                {
                    go.SetActive(true);
                    return go;
                }
            }
            GameObject newGo = new GameObject();
            pool.Add(newGo);
            return newGo;
        }
    }
}