using UnityEngine;
using UnityEditor;
using UnityEngine.UI;

namespace ToLuaGameFramework.Tacticsoft
{
    public class TableViewCreator : Editor
    {

        [MenuItem("ToLuaGameFramework/Create TableView &1")]
        private static void CreateTableView()
        {
            GameObject go = Selection.activeGameObject;
            if (go == null || go.GetComponent<RectTransform>() == null) go = GameObject.FindObjectOfType<Canvas>().gameObject;
            if (go == null)
            {
                Debug.LogError("You need create Canvas first!");
                return;
            }

            RectTransform rt = go.GetComponent<RectTransform>();
            GameObject tv0 = new GameObject("TableViewContainer");
            tv0.AddComponent<RectTransform>().SetParent(rt);
            tv0.transform.localPosition = Vector3.zero;
            Image img = tv0.AddComponent<Image>();
            img.color = new Color(1, 1, 1, 0.5f);
            tv0.AddComponent<Mask>();

            GameObject tv1 = new GameObject("TableView");
            rt = tv1.AddComponent<RectTransform>();
            rt.SetParent(tv0.transform);
            rt.localPosition = Vector3.zero;
            rt.anchorMax = Vector2.one;
            rt.anchorMin = Vector2.zero;
            rt.sizeDelta = Vector2.zero;
            ScrollRect sr = tv1.AddComponent<ScrollRect>();
            sr.horizontal = false;
            TableView tv = tv1.AddComponent<TableView>();
            Selectable ss = tv1.AddComponent<Selectable>();
            ss.transition = Selectable.Transition.None;

            GameObject tv2 = new GameObject("TableViewContent");
            rt = tv2.AddComponent<RectTransform>();
            sr.content = rt;
            rt.SetParent(tv1.transform);
            rt.localPosition = Vector3.zero;
            rt.anchorMin = Vector2.up;
            rt.anchorMax = Vector2.one;
            rt.pivot = new Vector2(0.5f, 1f);
            rt.sizeDelta = Vector2.zero;
            VerticalLayoutGroup vg = tv2.AddComponent<VerticalLayoutGroup>();
            vg.childControlWidth = true;
            vg.childControlHeight = true;
            vg.childForceExpandWidth = true;
            vg.childForceExpandHeight = false;
            vg.childAlignment = TextAnchor.UpperCenter;
            vg.spacing = 10;
        }

        [MenuItem("ToLuaGameFramework/Create TableViewX &2")]
        private static void CreateTableViewH()
        {
            GameObject go = Selection.activeGameObject;
            if (go == null || go.GetComponent<RectTransform>() == null) go = GameObject.FindObjectOfType<Canvas>().gameObject;
            if (go == null)
            {
                Debug.LogError("You need create Canvas first!");
                return;
            }

            RectTransform rt = go.GetComponent<RectTransform>();
            GameObject tv0 = new GameObject("TableViewContainer");
            tv0.AddComponent<RectTransform>().SetParent(rt);
            tv0.transform.localPosition = Vector3.zero;
            Image img = tv0.AddComponent<Image>();
            img.color = new Color(1, 1, 1, 0.5f);
            tv0.AddComponent<Mask>();

            GameObject tv1 = new GameObject("TableView");
            rt = tv1.AddComponent<RectTransform>();
            rt.SetParent(tv0.transform);
            rt.localPosition = Vector3.zero;
            rt.anchorMax = Vector2.one;
            rt.anchorMin = Vector2.zero;
            rt.sizeDelta = Vector2.zero;
            ScrollRect sr = tv1.AddComponent<ScrollRect>();
            sr.vertical = false;
            TableViewX tv = tv1.AddComponent<TableViewX>();
            Selectable ss = tv1.AddComponent<Selectable>();
            ss.transition = Selectable.Transition.None;

            GameObject tv2 = new GameObject("TableViewContent");
            rt = tv2.AddComponent<RectTransform>();
            sr.content = rt;
            rt.SetParent(tv1.transform);
            rt.localPosition = Vector3.zero;
            rt.anchorMin = Vector2.zero;
            rt.anchorMax = Vector2.up;
            rt.pivot = new Vector2(0f, 0.5f);
            rt.sizeDelta = Vector2.zero;
            HorizontalLayoutGroup vg = tv2.AddComponent<HorizontalLayoutGroup>();
            vg.childControlWidth = true;
            vg.childControlHeight = true;
            vg.childForceExpandWidth = false;
            vg.childForceExpandHeight = true;
            vg.childAlignment = TextAnchor.MiddleLeft;
            vg.spacing = 10;
        }
    }
}