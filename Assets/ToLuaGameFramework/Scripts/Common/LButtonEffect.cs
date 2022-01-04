using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

namespace ToLuaGameFramework
{
    public class LButtonEffect : MonoBehaviour, IPointerDownHandler, IPointerUpHandler
    {
        public Image targetImg;
        public RawImage targetRawImg;
        public bool scale = true, color, texture;
        public float pressScale = 0.95f;
        public Color changeColor = new Color(0.97f, 0.97f, 0.97f, 1);
        public Texture2D changeTexture;

        Color colorDefault;
        Sprite spriteDefault;
        Texture textureDefault;
        Vector3 defaultScale;
        LButton[] buttons;

        void Awake()
        {
            if (!targetImg)
            {
                targetImg = GetComponent<Image>();
            }
            if (!targetRawImg)
            {
                targetRawImg = GetComponent<RawImage>();
            }
            if (targetImg)
            {
                spriteDefault = targetImg.sprite;
                colorDefault = targetImg.color;
            }
            if (targetRawImg)
            {
                textureDefault = targetRawImg.texture;
                colorDefault = targetRawImg.color;
            }
            buttons = GetComponents<LButton>();
        }

        public void OnPointerDown(PointerEventData eventData)
        {
            if (targetImg && scale && defaultScale == Vector3.zero)
            {
                defaultScale = targetImg.transform.localScale;
            }
            if (targetRawImg && scale && defaultScale == Vector3.zero)
            {
                defaultScale = targetRawImg.transform.localScale;
            }

            if (IsButtonsEnable())
            {
                if (targetImg)
                {
                    if (scale)
                    {
                        targetImg.transform.localScale = defaultScale * pressScale;
                    }
                    if (texture)
                    {
                        targetImg.sprite = TextureToSprite(changeTexture);
                    }
                    if (color)
                    {
                        targetImg.color = changeColor;
                    }
                }
                if (targetRawImg)
                {
                    if (scale)
                    {
                        targetRawImg.transform.localScale = defaultScale * pressScale;
                    }
                    if (texture)
                    {
                        targetRawImg.texture = changeTexture;
                    }
                    if (color)
                    {
                        targetRawImg.color = changeColor;
                    }
                }
            }
        }

        public void OnPointerUp(PointerEventData eventData)
        {
            if (targetImg)
            {
                if (scale)
                {
                    targetImg.transform.localScale = defaultScale;
                }
                if (texture)
                {
                    targetImg.sprite = spriteDefault;
                }
                if (color)
                {
                    targetImg.color = colorDefault;
                }
            }
            if (targetRawImg)
            {
                if (scale)
                {
                    targetRawImg.transform.localScale = defaultScale;
                }
                if (texture)
                {
                    targetRawImg.texture = textureDefault;
                }
                if (color)
                {
                    targetRawImg.color = colorDefault;
                }
            }
        }

        bool IsButtonsEnable()
        {
            for (int i = 0; i < buttons.Length; i++)
            {
                if (buttons[i].enabled)
                {
                    return true;
                }
            }
            return false;
        }

        Sprite TextureToSprite(Texture2D texture)
        {
            return Sprite.Create(texture, new Rect(0, 0, texture.width, texture.height), new Vector2(0.5f, 0.5f));
        }

        /// <summary>
        /// 外部改变缩放值后重设这里的缩放值
        /// </summary>
        public void SetDefaultScale(Vector3 sacle)
        {
            defaultScale = sacle;
        }
    }
}