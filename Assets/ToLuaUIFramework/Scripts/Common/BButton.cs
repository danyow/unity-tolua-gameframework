using System;
using UnityEngine;
using UnityEngine.EventSystems;

namespace ToLuaUIFramework
{
    public class BButton : MonoBehaviour, IPointerDownHandler, IPointerClickHandler
    {
        public object param = 0;
        public float canTriggerInterval = 0f;
        public Action<object> onClick, onPointerDown;
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

        public void OnPointerDown(PointerEventData eventData)
        {
            if (enabled)
            {
                if (canTouchTimer <= 0f)
                {
                    if (onPointerDown != null) onPointerDown.Invoke(param);
                    canTouchTimer = canTriggerInterval;
                    CheckFindEffect();
                    if (buttonEffect && canTouchTimer > 0)
                    {
                        buttonEffect.enabled = false;
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
                    if (onClick != null) onClick.Invoke(param);
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