using LuaInterface;
using UnityEngine;
using UnityEngine.EventSystems;

namespace ToLuaGameFramework
{
    public class BButton : MonoBehaviour, IPointerDownHandler, IPointerClickHandler
    {
        public object param = 0;
        public LuaTable self;
        public float canTriggerInterval = 0f;
        public LuaFunction onClick, onDown;
        public RectTransform rectTransform { get { return transform as RectTransform; } }
        float canTouchTimer;
        BButtonEffect buttonEffect;

        void CheckFindEffect()
        {
            if (!buttonEffect)
            {
                buttonEffect = GetComponent<BButtonEffect>();
            }
        }

        void Update()
        {
            if (canTouchTimer > 0f)
            {
                canTouchTimer -= Time.deltaTime;
                if (canTouchTimer <= 0f)
                {
                    CheckFindEffect();
                    if (buttonEffect)
                    {
                        buttonEffect.enabled = true;
                    }
                }
            }
        }

        public void OnPointerClick(PointerEventData eventData)
        {
            if (enabled)
            {
                if (canTouchTimer <= 0f)
                {
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
                    }
                    canTouchTimer = canTriggerInterval;
                    CheckFindEffect();
                    if (buttonEffect && canTouchTimer > 0)
                    {
                        buttonEffect.enabled = false;
                    }
                }
            }
        }

        public void OnPointerDown(PointerEventData eventData)
        {
            if (enabled)
            {
                if (canTouchTimer <= 0f)
                {
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
                    }
                    canTouchTimer = canTriggerInterval;
                    CheckFindEffect();
                    if (buttonEffect && canTouchTimer > 0)
                    {
                        buttonEffect.enabled = false;
                    }
                }
            }
        }
    }
}