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
        bool isStarted;

        public void StartFramework()
        {
            if (isStarted) return;
            isStarted = true;

            CommandController.Instance.AddManager(typeof(ResManager));
            CommandController.Instance.AddManager(typeof(UIManager));
            CommandController.Instance.AddManager(typeof(LuaManager));
            CommandController.Instance.AddManager(typeof(SoundManager));
            CommandController.Instance.AddManager(typeof(HttpManager));

            CommandController.Instance.Execute(CommandEnum.UpdateRemoteAssetBundle);
        }

    }
}