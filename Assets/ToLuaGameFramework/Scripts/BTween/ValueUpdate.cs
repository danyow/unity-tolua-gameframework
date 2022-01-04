using System;
using UnityEngine;

namespace ToLuaGameFramework
{
    public class ValueUpdate : MonoBehaviour
    {
        public Action<float> UpdateEvent;
        public Action FinishEvent;
        BTween tween;
        float delay = 0, t = 0, d = 0, b = 0, c = 0;
        float toValue;

        public void Destroy()
        {
            Destroy(gameObject);
        }

        void Update()
        {
            if (delay > 0)
            {
                delay -= Time.deltaTime;
                return;
            }
            if (tween == null)
            {
                return;
            }
            SetValue(t, d);
            if (t < d)
            {
                t += Time.deltaTime;
            }
            else
            {
                SetValue(0, 0, toValue);
                if (FinishEvent != null)
                {
                    FinishEvent();
                }
                Destroy(gameObject);
            }
        }

        void SetValue(float t, float d, float toValue = -1f)
        {
            if (toValue == -1f)
            {
                UpdateEvent((float)tween.Ease(t, b, c, d));
            }
            else
            {
                UpdateEvent(toValue);
            }
        }

        public void Value(float delay, float startValue, float toValue, float time, BEaseType method, Action<float> updateEvent, Action finishEvent)
        {
            this.delay = delay;
            this.toValue = toValue;
            t = 0f;
            b = startValue;
            c = this.toValue - b;
            d = time;
            this.UpdateEvent = updateEvent;
            this.FinishEvent = finishEvent;
            switch (method)
            {
                case BEaseType.Linear:
                    tween = new LinearEase();
                    break;
                case BEaseType.ExpoIn:
                    tween = new ExpoEaseIn();
                    break;
                case BEaseType.ExpoOut:
                    tween = new ExpoEaseOut();
                    break;
                case BEaseType.ExpoInOut:
                    tween = new ExpoEaseInOut();
                    break;
                case BEaseType.SineIn:
                    tween = new SineEaseIn();
                    break;
                case BEaseType.SineOut:
                    tween = new SineEaseOut();
                    break;
                case BEaseType.SineInOut:
                    tween = new SineEaseInOut();
                    break;
                case BEaseType.ElasticIn:
                    tween = new ElasticEaseIn();
                    break;
                case BEaseType.ElasticOut:
                    tween = new ElasticEaseOut();
                    break;
                case BEaseType.ElasticInOut:
                    tween = new ElasticEaseInOut();
                    break;
                case BEaseType.BackIn:
                    tween = new BackEaseIn();
                    break;
                case BEaseType.BackOut:
                    tween = new BackEaseOut();
                    break;
                case BEaseType.BackInOut:
                    tween = new BackEaseInOut();
                    break;
                case BEaseType.BounceIn:
                    tween = new BounceEaseIn();
                    break;
                case BEaseType.BounceOut:
                    tween = new BounceEaseOut();
                    break;
                case BEaseType.BounceInOut:
                    tween = new BounceEaseInOut();
                    break;
                default:
                    tween = new SineEaseOut();
                    break;
            }
        }

    }
}