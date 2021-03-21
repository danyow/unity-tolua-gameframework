using LuaInterface;
using System;
using System.Collections.Generic;
using UnityEngine;

namespace ToLuaUIFramework
{
    public class UIManager : MonoBehaviour, ICommand
    {
        public class M_LuaFunction : LuaFunction
        {
            public M_LuaFunction(int reference, LuaState state) : base(reference, state) { }
            public Action<GameObject> action;
        }

        public static UIManager instance;

        static List<LuaBehaviour> uiStack = new List<LuaBehaviour>();
        static List<LuaBehaviour> currVisibleUIList = new List<LuaBehaviour>();

        void Awake()
        {
            instance = this;
        }
        public bool ExeCommand(CommandEnum command)
        {
            return false;
        }

        /// <summary>
        /// 创建UI
        /// </summary>
        public static GameObject SpawnUI(string prefabPath, Transform parent, bool isUIStack = true, bool keepActive = false, bool isFloat = false, bool destroyABAfterSpawn = false, bool destroyABAfterAllSpawnDestroy = false)
        {
            if (string.IsNullOrEmpty(prefabPath))
            {
                Debug.LogError("prefabPath为空");
                return null;
            }
            //UI当单例使用，先从站内查找，有则直接显示,从栈顶往下找，更快找到
            for (int i = uiStack.Count - 1; i >= 0; i--)
            {
                LuaBehaviour _luaBehaviour = uiStack[i];
                if (_luaBehaviour.prefabPath.Equals(prefabPath))
                {
                    if (_luaBehaviour.transform.parent != parent)
                    {
                        _luaBehaviour.transform.SetParent(parent, false);
                    }
                    if (i < uiStack.Count - 1)
                    {
                        uiStack.RemoveAt(i);
                        uiStack.Add(_luaBehaviour);
                    }
                    RefreshStack();
                    _luaBehaviour.isUIStack = isUIStack;
                    _luaBehaviour.keepActive = keepActive;
                    _luaBehaviour.isFloat = isFloat;
                    _luaBehaviour.destroyABAfterAllSpawnDestroy = destroyABAfterAllSpawnDestroy;
                    return _luaBehaviour.gameObject;
                }
            }
            //开始创建
            GameObject go = ResManager.SpawnPrefab(prefabPath, parent, destroyABAfterSpawn, destroyABAfterAllSpawnDestroy);
            LuaBehaviour luaBehaviour = go.GetComponent<LuaBehaviour>();
            luaBehaviour.isUIStack = isUIStack;
            luaBehaviour.keepActive = keepActive;
            luaBehaviour.isFloat = isFloat;
            //检测到时带Camera的Canvas，则默认忽略父级，直接放根目录
            Canvas canvas = go.GetComponentInChildren<Canvas>();
            if(canvas && !canvas.overrideSorting && canvas.renderMode == RenderMode.ScreenSpaceCamera && canvas.worldCamera)
            {
                go.transform.SetParent(null, false);
            }
            //处理入栈
            if (luaBehaviour.isUIStack)
            {
                uiStack.Add(luaBehaviour);
                RefreshStack();
            }
            return go;
        }

        /// <summary>
        /// 异步创建UI
        /// </summary>
        public void SpawnUIAsyn(string prefabPath, Transform parent, LuaFunction callback, bool isUIStack = true, bool keepActive = false, bool isFloat = false, bool destroyABAfterSpawn = false, bool destroyABAfterAllSpawnDestroy = false)
        {
            if (string.IsNullOrEmpty(prefabPath))
            {
                Debug.LogError("prefabPath为空");
                return;
            }
            //UI当单例使用，先从站内查找，有则直接显示,从栈顶往下找，更快找到
            for (int i = uiStack.Count - 1; i >= 0; i--)
            {
                LuaBehaviour luaBehaviour = uiStack[i];
                if (luaBehaviour.prefabPath.Equals(prefabPath))
                {
                    if (luaBehaviour.transform.parent != parent)
                    {
                        luaBehaviour.transform.SetParent(parent, false);
                    }
                    if (i < uiStack.Count - 1)
                    {
                        uiStack.RemoveAt(i);
                        uiStack.Add(luaBehaviour);
                    }
                    RefreshStack();
                    luaBehaviour.isUIStack = isUIStack;
                    luaBehaviour.keepActive = keepActive;
                    luaBehaviour.isFloat = isFloat;
                    luaBehaviour.destroyABAfterAllSpawnDestroy = destroyABAfterAllSpawnDestroy;
                    if (callback != null) callback.Call(luaBehaviour.gameObject, true);
                    return;
                }
            }
            //开始创建
            M_LuaFunction luaFunction = null;
            if (callback != null)
            {
                luaFunction = new M_LuaFunction(0, null);
                luaFunction.action = (GameObject go) =>
                {
                    LuaBehaviour luaBehaviour = go.GetComponent<LuaBehaviour>();
                    luaBehaviour.isUIStack = isUIStack;
                    luaBehaviour.keepActive = keepActive;
                    luaBehaviour.isFloat = isFloat;
                    //处理入栈
                    if (luaBehaviour.isUIStack)
                    {
                        uiStack.Add(luaBehaviour);
                        RefreshStack();
                        callback.Call(go);
                    }
                };
            }
            ResManager.SpawnPrefabAsyn(prefabPath, parent, luaFunction, destroyABAfterSpawn, destroyABAfterAllSpawnDestroy);
        }

        /// <summary>
        /// 不在栈顶的UI重新到栈顶显示
        /// </summary>
        public void ResumeUI(GameObject go)
        {
            for (int i = 0; i < uiStack.Count; i++)
            {
                LuaBehaviour behaviour = uiStack[i];
                if (behaviour.gameObject == go)
                {
                    uiStack.RemoveAt(i);
                    uiStack.Add(behaviour);
                    RefreshStack();
                    break;
                }
            }
        }

        /// <summary>
        /// 清空删除栈内所有UI
        /// </summary>
        public void ClearAllUI()
        {
            for (int i = 0; i < uiStack.Count; i++)
            {
                LuaBehaviour behaviour = uiStack[i];
                if (behaviour)
                {
                    Destroy(behaviour.gameObject);
                }
            }
            uiStack.Clear();
        }

        /// <summary>
        /// 刷新UI栈
        /// </summary>
        public void OnUIDestroy(LuaBehaviour behaviour)
        {
            if (uiStack.Contains(behaviour))
            {
                uiStack.Remove(behaviour);
            }
            RefreshStack();
        }

        /// <summary>
        /// 也可以由Lua调用刷新，用于非SpawnUI方法生成UI后有ParticleSystem元素出现层级问题时重新刷新层级关系
        /// </summary>
        public static void RefreshStack()
        {
            currVisibleUIList.Clear();
            for (int i = 0; i < uiStack.Count; i++)
            {
                LuaBehaviour behaviour = uiStack[i];
                if (i == uiStack.Count - 1)
                {
                    //栈顶必显示
                    if (!behaviour.gameObject.activeInHierarchy) behaviour.gameObject.SetActive(true);
                }
                else
                {
                    if (AllOverLayerIsFloat(i))
                    {
                        //底部：如果上面都是悬浮窗，则顶部第一个非悬浮窗要显示
                        if (!behaviour.gameObject.activeInHierarchy) behaviour.gameObject.SetActive(true);
                    }
                    else
                    {
                        //底部：只要不是常驻窗口，就隐藏
                        if (behaviour.gameObject.activeInHierarchy) behaviour.gameObject.SetActive(behaviour.keepActive);
                    }
                }
                //统计所有当前显示的UI列表，用于遍历设置层级
                if (behaviour.gameObject.activeInHierarchy)
                {
                    currVisibleUIList.Add(behaviour);
                }
            }
            //遍历设置层级
            for (int i = 0; i < currVisibleUIList.Count; i++)
            {
                LuaBehaviour luaBehaviour = currVisibleUIList[i];
                //如果前一层被设置过，说明前一层又PartileSystem或者Canvas，则本层也需要追加Canvas才能盖住
                if (i > 0 && currVisibleUIList[i - 1].IsSetedOrder)
                {
                    luaBehaviour.AddCanvas();
                }
                luaBehaviour.SetOrders(i);
            }
        }

        //由Lua调用：
        //如果Lua动态给某个模块UI添加了子物体，且子物体包含ParticleSystem或者Canvas组件，则在设置父级完成后需要调用本方法刷新
        public static void RefreshSortObjects(Transform trans)
        {
            LuaBehaviour luaBehaviour = trans.GetComponent<LuaBehaviour>();
            if (luaBehaviour)
            {
                luaBehaviour.sortObjects.Clear();
                luaBehaviour.RefreshSortObjects(trans);
            }
        }

        #region 内部方法

        /// <summary>
        /// 是否当前层上面的层全是浮动层
        /// </summary>
        /// <returns></returns>
        static bool AllOverLayerIsFloat(int currIndex)
        {
            for (int i = 0; i < uiStack.Count; i++)
            {
                LuaBehaviour behaviour = uiStack[i];
                if (i > currIndex)
                {
                    if (!behaviour.isFloat)
                    {
                        return false;
                    }
                }
            }
            return true;
        }
        #endregion
    }
}