using LuaInterface;
using UnityEngine;
using UnityEngine.EventSystems;

namespace ToLuaGameFramework
{
    public class LButtonPressEnter : LButton, IPointerEnterHandler
    {
        public LuaFunction onPressEnter;

        public void OnPointerEnter(PointerEventData eventData)
        {
            if (!enabled || canTouchTimer > 0f)
            {
                return;
            }
            if (Input.GetMouseButton(0))
            {
                if (onPressEnter != null)
                {
                    if (self == null)
                    {
                        onPressEnter.Call(param);
                    }
                    else
                    {
                        onPressEnter.Call(self, param);
                    }
                    canTouchTimer = canTriggerInterval;
                }
            }
        }
    }
}