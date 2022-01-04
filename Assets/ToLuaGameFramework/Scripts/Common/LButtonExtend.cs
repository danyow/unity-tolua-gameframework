using LuaInterface;
using UnityEngine;

namespace ToLuaGameFramework
{
    public static class LButtonExtend
    {

        public static LButton OnClick(this Transform btn, LuaFunction clickEvent, LuaTable self = null, object param = null, bool addTriggerEffect = true, float interval = 0.5f)
        {
            LButtonClick bButton = btn.GetComponent<LButtonClick>();
            if (!bButton)
            {
                bButton = btn.gameObject.AddComponent<LButtonClick>();
            }
            bButton.onClick = clickEvent;
            bButton.param = param;
            bButton.self = self;
            bButton.canTriggerInterval = interval;
            if (addTriggerEffect)
            {
                LButtonEffect effect = btn.gameObject.GetComponent<LButtonEffect>();
                if (!effect)
                {
                    btn.gameObject.AddComponent<LButtonEffect>();
                }
            }
            else
            {
                LButtonEffect effect = btn.gameObject.GetComponent<LButtonEffect>();
                if (effect)
                {
                    GameObject.Destroy(effect);
                }
            }
            return bButton;
        }

        public static LButton OnDown(this Transform btn, LuaFunction downEvent, LuaTable self = null, object param = null, bool addTriggerEffect = true, float interval = 1)
        {
            LButtonDown bButton = btn.GetComponent<LButtonDown>();
            if (!bButton)
            {
                bButton = btn.gameObject.AddComponent<LButtonDown>();
            }
            bButton.onDown = downEvent;
            bButton.param = param;
            bButton.self = self;
            bButton.canTriggerInterval = interval;
            if (addTriggerEffect)
            {
                LButtonEffect effect = btn.gameObject.GetComponent<LButtonEffect>();
                if (!effect)
                {
                    btn.gameObject.AddComponent<LButtonEffect>();
                }
            }
            else
            {
                LButtonEffect effect = btn.gameObject.GetComponent<LButtonEffect>();
                if (effect)
                {
                    GameObject.Destroy(effect);
                }
            }
            return bButton;
        }

        public static LButton OnPressEnter(this Transform btn, LuaFunction pressEnterEvent, LuaTable self = null, object param = null, bool addTriggerEffect = true, float interval = 1)
        {
            LButtonPressEnter bButton = btn.GetComponent<LButtonPressEnter>();
            if (!bButton)
            {
                bButton = btn.gameObject.AddComponent<LButtonPressEnter>();
            }
            bButton.onPressEnter = pressEnterEvent;
            bButton.param = param;
            bButton.self = self;
            bButton.canTriggerInterval = interval;
            if (addTriggerEffect)
            {
                LButtonEffect effect = btn.gameObject.GetComponent<LButtonEffect>();
                if (!effect)
                {
                    btn.gameObject.AddComponent<LButtonEffect>();
                }
            }
            else
            {
                LButtonEffect effect = btn.gameObject.GetComponent<LButtonEffect>();
                if (effect)
                {
                    GameObject.Destroy(effect);
                }
            }
            return bButton;
        }

        public static LButton ClearEvent(this Transform btn)
        {
            LButton bButton = btn.GetComponent<LButton>();
            if (bButton)
            {
                GameObject.Destroy(bButton);
            }
            LButtonEffect effect = btn.gameObject.GetComponent<LButtonEffect>();
            if (effect)
            {
                GameObject.Destroy(effect);
            }
            return bButton;
        }

    }
}