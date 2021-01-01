﻿using System;
using UnityEngine;

namespace ToLuaUIFramework
{
    public class LuaBehaviour : MonoBehaviour
    {
        public string assetBundleName;
        public string prefabPath;
        public bool keepActive;
        public bool isFloat;
        public bool destroyABAfterAllSpawnDestroy;
        Action onEnable, onStart, onDisable, onDestroy;

        public Canvas canvas;
        public int sortingOrder;
        public float cameraDepth;

        /// <summary>
        /// 去掉尾部(Clone)
        /// </summary>
        string _name;

        public void SetEnableAction(Action onEnable)
        {
            this.onEnable = onEnable;
        }

        public void SetStartAction(Action onStart)
        {
            this.onStart = onStart;
        }

        public void SetDisableAction(Action onDisable)
        {
            this.onDisable = onDisable;
        }

        public void SetDestroyAction(Action onDestroy)
        {
            this.onDestroy = onDestroy;
        }

        protected virtual void Awake()
        {
            canvas = GetComponentInChildren<Canvas>();
            if (canvas)
            {
                if (canvas.renderMode == RenderMode.ScreenSpaceOverlay)
                {
                    sortingOrder = canvas.sortingOrder;
                }
                else if (canvas.renderMode == RenderMode.ScreenSpaceCamera)
                {
                    cameraDepth = canvas.worldCamera.depth;
                }
            }
        }

        protected virtual void OnEnable()
        {
            if (onEnable != null) onEnable.Invoke();
        }

        protected virtual void Start()
        {
            if (onStart != null) onStart.Invoke();
        }

        protected virtual void OnDisable()
        {
            if (onDisable != null) onDisable.Invoke();
            if (canvas)
            {
                if (canvas.renderMode == RenderMode.ScreenSpaceOverlay)
                {
                    canvas.sortingOrder = sortingOrder;
                }
                else if (canvas.renderMode == RenderMode.ScreenSpaceCamera)
                {
                    canvas.worldCamera.depth = cameraDepth;
                }
            }
        }

        protected virtual void OnDestroy()
        {
            if (onDestroy != null) onDestroy.Invoke();
            UIManager.instance.OnUIDestroy(this);
            if (!string.IsNullOrEmpty(assetBundleName))
            {
                ResManager.instance.OnSpawnDestroy(assetBundleName, destroyABAfterAllSpawnDestroy);
            }
            ResManager.instance.ClearMemory();
        }
    }
}