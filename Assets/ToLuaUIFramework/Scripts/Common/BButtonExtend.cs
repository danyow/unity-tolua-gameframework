using System;
using UnityEngine;

namespace ToLuaUIFramework
{
    public static class BButtonExtend
    {

        public static void OnClick(this Transform btn, Action<object> clickEvent, bool addClickEffect = true)
        {
            btn.OnClick(0, clickEvent, addClickEffect);
        }

        public static void OnClick(this Transform btn, object param, Action<object> clickEvent, bool addClickEffect = true)
        {
            BButton bButton = btn.GetComponent<BButton>();
            if (!bButton)
            {
                bButton = btn.gameObject.AddComponent<BButton>();
            }
            bButton.param = param;
            bButton.onClick = clickEvent;
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

        public static void OnPointerDown(this Transform btn, Action<object> pointerDownEvent, bool addClickEffect = true)
        {
            btn.OnPointerDown(0, pointerDownEvent, addClickEffect);
        }

        public static void OnPointerDown(this Transform btn, object param, Action<object> pointerDownEvent, bool addClickEffect = true)
        {
            BButton bButton = btn.GetComponent<BButton>();
            if (!bButton)
            {
                bButton = btn.gameObject.AddComponent<BButton>();
            }
            bButton.param = param;
            bButton.onPointerDown = pointerDownEvent;
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