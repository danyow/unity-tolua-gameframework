using LuaInterface;
using UnityEngine.EventSystems;

namespace ToLuaGameFramework
{
    public class LButtonClick : LButton, IPointerClickHandler
    {
        public LuaFunction onClick;

        public void OnPointerClick(PointerEventData eventData)
        {
            if (!enabled || canTouchTimer > 0f)
            {
                return;
            }
            if (onClick != null)
            {
                if (self == null)
                {
                    onClick.Call(param);
                }
                else
                {
                    onClick.Call(self, param);
                }
                canTouchTimer = canTriggerInterval;
            }
        }
    }
}