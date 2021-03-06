using UnityEngine;

namespace ToLuaGameFramework
{
    public class LuaMain : MonoBehaviour
    {
        private static LuaMain _instance;
        public static LuaMain Instance
        {
            get
            {
                if (!_instance)
                {
                    _instance = GameObject.FindObjectOfType<LuaMain>();
                    if (!_instance)
                    {
                        GameObject go = new GameObject("LuaMain");
                        DontDestroyOnLoad(go);
                        _instance = go.AddComponent<LuaMain>();
                    }
                }
                return _instance;
            }
        }

        public void StartFramework()
        {
            if (!gameObject.GetComponent<ResManager>())
            {
                gameObject.AddComponent<ResManager>();
                gameObject.AddComponent<UIManager>();
                gameObject.AddComponent<LuaManager>();
                gameObject.AddComponent<SoundManager>();
                gameObject.AddComponent<HttpManager>();

                ResManager.instance.StartUpdateABOnStartup();
            }
        }

    }
}