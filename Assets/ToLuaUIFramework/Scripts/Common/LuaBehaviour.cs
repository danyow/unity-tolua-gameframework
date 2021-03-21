﻿using LuaInterface;
using System.Collections.Generic;
using UnityEngine;

namespace ToLuaUIFramework
{
    public class LuaBehaviour : MonoBehaviour
    {
        public class SortObject
        {
            public Canvas canvas;
            public Renderer particle;
            public int originSort;
            public float originDepth;
            LuaBehaviour luaBehaviour;
            public SortObject(LuaBehaviour luaBehaviour, Canvas canvas, Renderer particleRenderer)
            {
                this.luaBehaviour = luaBehaviour;
                this.canvas = canvas;
                this.particle = particleRenderer;
                if (this.canvas)
                {
                    originSort = this.canvas.sortingOrder;
                    if (!this.canvas.overrideSorting && this.canvas.renderMode == RenderMode.ScreenSpaceCamera && this.canvas.worldCamera)
                    {
                        this.originDepth = this.canvas.worldCamera.depth;
                    }
                }
                else if (this.particle)
                {
                    originSort = this.particle.sortingOrder;
                }
            }
            public void SetOrder(int order)
            {
                if (this.canvas)
                {
                    this.canvas.sortingOrder = order;
                    if (!this.canvas.overrideSorting && this.canvas.renderMode == RenderMode.ScreenSpaceCamera && this.canvas.worldCamera)
                    {
                        //查找全场，比全场最大的摄影机depth值再大1即可
                        float currMaxDepth = float.MinValue;
                        Canvas[] canvases = GameObject.FindObjectsOfType<Canvas>();
                        for (int i = 0; i < canvases.Length; i++)
                        {
                            Canvas _canvas = canvases[i];
                            if (_canvas != this.canvas && !_canvas.overrideSorting && _canvas.renderMode == RenderMode.ScreenSpaceCamera && _canvas.worldCamera)
                            {
                                if (_canvas.worldCamera.depth > currMaxDepth) currMaxDepth = _canvas.worldCamera.depth;
                            }
                        }
                        this.canvas.worldCamera.depth = currMaxDepth + 1;
                        this.luaBehaviour.transform.position = new Vector3(currMaxDepth + 1 * 50, 0, 0);
                    }
                }
                else if (this.particle)
                {
                    this.particle.sortingOrder = order;
                }
            }

            public void ResumeOrder()
            {
                if (this.canvas)
                {
                    this.canvas.sortingOrder = originSort;
                    if (!this.canvas.overrideSorting && this.canvas.renderMode == RenderMode.ScreenSpaceCamera && this.canvas.worldCamera)
                    {
                        this.canvas.worldCamera.depth = originDepth;
                    }
                }
                else if (this.particle)
                {
                    this.particle.sortingOrder = originSort;
                }
            }
        }
        public string assetBundleName;
        public string prefabPath;
        public bool isUIStack;
        public bool keepActive;
        public bool isFloat;
        public bool destroyABAfterAllSpawnDestroy;
        string luaClassId;
        LuaTable luaClass;

        public List<SortObject> sortObjects = new List<SortObject>();
        public bool IsSetedOrder { get; private set; }
        public void SetOrders(int order)
        {
            for (int i = 0; i < sortObjects.Count; i++)
            {
                LuaBehaviour.SortObject sortObject = sortObjects[i];
                sortObject.SetOrder(order * 1000 + i);
            }
            IsSetedOrder = sortObjects.Count > 0;
        }

        public void AddCanvas()
        {
            Canvas canvas = GetComponent<Canvas>();
            if (!canvas)
            {
                canvas = gameObject.AddComponent<Canvas>();
                canvas.overrideSorting = true;
                //加到首位
                List<SortObject> _sortObjects = new List<SortObject>() { new SortObject(this, canvas, null) };
                _sortObjects.AddRange(sortObjects);
                sortObjects = _sortObjects;
            }
        }

        /// <summary>
        /// Lua调用
        /// </summary>
        public void SetLuaClass(LuaTable luaClass)
        {
            this.luaClass = luaClass;
        }

        /// <summary>
        /// Lua调用
        /// </summary>
        public void SetLuaClassId(string luaClassId)
        {
            this.luaClassId = luaClassId;
        }

        protected virtual void Awake()
        {
            RefreshSortObjects(transform);
        }

        //如果Lua动态给本UI添加子物体，且子物体包含ParticleSystem或者Canvas组件，则在设置父级完成后需要调用本方法刷新
        public void RefreshSortObjects(Transform trans)
        {
            Canvas canvas = trans.GetComponent<Canvas>();
            if (canvas)
            {
                sortObjects.Add(new SortObject(this, canvas, null));
            }
            else
            {
                ParticleSystem particle = trans.GetComponent<ParticleSystem>();
                if (particle)
                {
                    sortObjects.Add(new SortObject(this, null, particle.GetComponent<Renderer>()));
                }
            }
            for (int i = 0; i < trans.childCount; i++)
            {
                RefreshSortObjects(trans.GetChild(i));
            }
        }

        protected virtual void OnEnable()
        {
            if (luaClass != null) luaClass.GetLuaFunction("onEnable").Call(luaClass);
        }

        protected virtual void Start()
        {
            if (luaClass != null) luaClass.GetLuaFunction("onStart").Call(luaClass);
        }

        protected virtual void OnDisable()
        {
            if (luaClass != null) luaClass.GetLuaFunction("onDisable").Call(luaClass);
            //还原sorting
            for (int i = 0; i < sortObjects.Count; i++)
            {
                sortObjects[i].ResumeOrder();
            }
            IsSetedOrder = false;
        }

        protected virtual void OnDestroy()
        {
            if (luaClass != null) luaClass.GetLuaFunction("onDestroy").Call(luaClass);
            if (LuaManager.instance)
            {
                if (!string.IsNullOrEmpty(luaClassId))
                {
                    LuaManager.instance.GetFunction("OnGameObjectDestroy").Call(luaClassId);
                }
                if (luaClass != null)
                {
                    LuaManager.instance.GetFunction("clear_class").Call(luaClass);
                }
            }
            if (UIManager.instance)
            {
                UIManager.instance.OnUIDestroy(this);
            }
            if (ResManager.instance)
            {
                if (!string.IsNullOrEmpty(assetBundleName))
                {
                    ResManager.instance.OnSpawnDestroy(assetBundleName, destroyABAfterAllSpawnDestroy);
                }
                ResManager.instance.ClearMemory();
            }
        }

    }
}