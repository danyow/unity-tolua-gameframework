using LuaInterface;
using UnityEngine.EventSystems;

namespace ToLuaGameFramework
{
    public class LButtonDown : LButton, IPointerDownHandler
    {
        public LuaFunction onDown;

        public void OnPointerDown(PointerEventData eventData)
        {
            if (!enabled || canTouchTimer > 0f)
            {
                return;
            }
            if (onDown != null)
            {
                if (self == null)
                {
                    onDown.Call(param);
                }
                else
                {
                    onDown.Call(self, param);
                }
                canTouchTimer = canTriggerInterval;
            }
        }

    }
}