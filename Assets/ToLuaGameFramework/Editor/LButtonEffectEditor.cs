using UnityEngine;
using UnityEditor;
using UnityEngine.UI;

namespace ToLuaGameFramework
{
    [CustomEditor(typeof(LButtonEffect))]
    public class LButtonEffectEditor : Editor
    {
        LButtonEffect buttonChange;

        void OnEnable()
        {
            buttonChange = (LButtonEffect)target;
        }

        public override void OnInspectorGUI()
        {
            buttonChange.targetImg = (Image)EditorGUILayout.ObjectField("Target", buttonChange.targetImg, typeof(Image), true);
            buttonChange.scale = EditorGUILayout.Toggle("Scale", buttonChange.scale);
            if (buttonChange.scale)
            {
                buttonChange.pressScale = EditorGUILayout.FloatField("    ChangeScale", buttonChange.pressScale);
            }
            buttonChange.color = EditorGUILayout.Toggle("Color", buttonChange.color);
            if (buttonChange.color)
            {
                buttonChange.changeColor = EditorGUILayout.ColorField("    ColorChange", buttonChange.changeColor);
            }
            buttonChange.texture = EditorGUILayout.Toggle("Texture", buttonChange.texture);
            if (buttonChange.texture)
            {
                buttonChange.changeTexture = (Texture2D)EditorGUILayout.ObjectField("    SpriteChange", buttonChange.changeTexture, typeof(Texture2D), true);
            }
        }
    }
}