using LuaInterface;
using UnityEngine;

namespace ToLuaGameFramework
{
    public class LButton : MonoBehaviour
    {
        public object param = 0;
        public LuaTable self;
        public float canTriggerInterval = 0.5f;
        internal float canTouchTimer;

        protected virtual void OnEnable()
        {
            canTouchTimer = 0;
        }

        protected virtual void Update()
        {
            if (canTouchTimer > 0f)
            {
                canTouchTimer -= Time.deltaTime;
            }
        }
        
    }
}