using LuaInterface;
using UnityEngine;

namespace ToLuaGameFramework
{
    public static class LButtonExtend
    {

        public static void OnClick(this Transform btn, LuaFunction clickEvent, LuaTable self = null, bool addClickEffect = true)
        {
            btn.OnClick(0, clickEvent, self, addClickEffect);
        }

        public static void OnClick(this Transform btn, object param, LuaFunction clickEvent, LuaTable self = null, bool addClickEffect = true)
        {
            LButton bButton = btn.GetComponent<LButton>();
            if (!bButton)
            {
                bButton = btn.gameObject.AddComponent<LButton>();
            }
            bButton.param = param;
            bButton.onClick = clickEvent;
            bButton.self = self;
            if (addClickEffect)
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
        }

        public static void OnDown(this Transform btn, LuaFunction pointerDownEvent, LuaTable self = null, bool addClickEffect = true)
        {
            btn.OnDown(0, pointerDownEvent, self, addClickEffect);
        }

        public static void OnDown(this Transform btn, object param, LuaFunction pointerDownEvent, LuaTable self = null, bool addClickEffect = true)
        {
            LButton bButton = btn.GetComponent<LButton>();
            if (!bButton)
            {
                bButton = btn.gameObject.AddComponent<LButton>();
            }
            bButton.param = param;
            bButton.onDown = pointerDownEvent;
            bButton.self = self;
            if (addClickEffect)
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
        }

    }
}