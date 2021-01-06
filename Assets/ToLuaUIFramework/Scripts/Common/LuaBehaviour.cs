using LuaInterface;
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
                    if (this.canvas.renderMode == RenderMode.ScreenSpaceCamera && this.canvas.worldCamera)
                    {
                        this.originDepth = this.canvas.worldCamera.depth;
                    }
                }
                else if (this.particle)
                {
                    originSort = this.particle.sortingOrder;
                }
            }
            public void SetOrder(int order, float cameraDepth)
            {
                if (this.canvas)
                {
                    this.canvas.sortingOrder = order;
                    if (this.canvas.renderMode == RenderMode.ScreenSpaceCamera && this.canvas.worldCamera)
                    {
                        this.canvas.worldCamera.depth = cameraDepth;
                        this.luaBehaviour.transform.position = new Vector3(cameraDepth * 50, 0, 0);
                    }
                }
                else if (this.particle)
                {
                    this.particle.sortingOrder = order;
                }
            }
        }
        public string assetBundleName;
        public string prefabPath;
        public bool keepActive;
        public bool isFloat;
        public bool destroyABAfterAllSpawnDestroy;
        int uiID = -1;
        LuaTable luaClass;

        public List<SortObject> sortObjects = new List<SortObject>();

        /// <summary>
        /// Lua调用
        /// </summary>
        public void SetLuaClazz(LuaTable luaClass)
        {
            this.luaClass = luaClass;
        }

        /// <summary>
        /// Lua调用
        /// </summary>
        public void SetUIID(int uiID)
        {
            this.uiID = uiID;
        }

        protected virtual void Awake()
        {
            FindSortObjects(transform);
        }

        void FindSortObjects(Transform trans)
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
                FindSortObjects(trans.GetChild(i));
            }
        }

        protected virtual void OnEnable()
        {
            if (luaClass != null) luaClass.GetLuaFunction("onEnable").Call(luaClass);
        }

        protected virtual void Start()
        {
            luaClass.GetLuaFunction("onStart").Call(luaClass);
        }

        protected virtual void OnDisable()
        {
            if (luaClass != null) luaClass.GetLuaFunction("onDisable").Call(luaClass);
            //还原sorting
            for (int i = 0; i < sortObjects.Count; i++)
            {
                SortObject sortObject = sortObjects[i];
                sortObject.SetOrder(sortObject.originSort, sortObject.originDepth);
            }
        }

        protected virtual void OnDestroy()
        {
            if (luaClass != null) luaClass.GetLuaFunction("onDestroy").Call(luaClass);
            if (LuaManager.instance)
            {
                if (uiID >= 0)
                {
                    LuaManager.instance.GetFunction("onUIDestroy").Call(uiID);
                }
                LuaManager.instance.GetFunction("clear_class").Call(luaClass);
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