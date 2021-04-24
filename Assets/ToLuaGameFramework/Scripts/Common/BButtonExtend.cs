using LuaInterface;
using UnityEngine;

namespace ToLuaGameFramework
{
    public static class BButtonExtend
    {

        public static void OnClick(this Transform btn, LuaFunction clickEvent, LuaTable self = null, bool addClickEffect = true)
        {
            btn.OnClick(0, clickEvent, self, addClickEffect);
        }

        public static void OnClick(this Transform btn, object param, LuaFunction clickEvent, LuaTable self = null, bool addClickEffect = true)
        {
            BButton bButton = btn.GetComponent<BButton>();
            if (!bButton)
            {
                bButton = btn.gameObject.AddComponent<BButton>();
            }
            bButton.param = param;
            bButton.onClick = clickEvent;
            bButton.self = self;
            if (addClickEffect)
            {
                BButtonEffect effect = btn.gameObject.GetComponent<BButtonEffect>();
                if (!effect)
                {
                    btn.gameObject.AddComponent<BButtonEffect>();
                }
            }
            else
            {
                BButtonEffect effect = btn.gameObject.GetComponent<BButtonEffect>();
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
            BButton bButton = btn.GetComponent<BButton>();
            if (!bButton)
            {
                bButton = btn.gameObject.AddComponent<BButton>();
            }
            bButton.param = param;
            bButton.onDown = pointerDownEvent;
            bButton.self = self;
            if (addClickEffect)
            {
                BButtonEffect effect = btn.gameObject.GetComponent<BButtonEffect>();
                if (!effect)
                {
                    btn.gameObject.AddComponent<BButtonEffect>();
                }
            }
            else
            {
                BButtonEffect effect = btn.gameObject.GetComponent<BButtonEffect>();
                if (effect)
                {
                    GameObject.Destroy(effect);
                }
            }
        }

    }
}