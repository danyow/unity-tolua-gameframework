using ToLuaGameFramework;
using UnityEngine;
using UnityEngine.UI;

public class LaunchSceneManager : MonoBehaviour
{
    public Text text;
    public Slider slider;

    private void Start()
    {
        DontDestroyOnLoad(gameObject);

        //注册好各种事件，然后直接调用 Main.Instance.StartFramework(); 即可

        MessageCenter.Add(MsgEnum.ABLoadingBegin, (BaseMsg msg) =>
        {
            text.text = "正在更新资源";
            slider.value = 0;
            MessageCenter.Remove(MsgEnum.ABLoadingBegin);
        });
        MessageCenter.Add(MsgEnum.ABLoadingError, (BaseMsg msg) =>
        {
            text.text = msg.args[0].ToString();
        });
        MessageCenter.Add(MsgEnum.ABLoadingProgress, (BaseMsg msg) =>
        {
            float progress = float.Parse(msg.args[0].ToString());
            text.text = Mathf.FloorToInt(progress * 100) + "%";
            slider.value = progress;
        });
        MessageCenter.Add(MsgEnum.ABLoadingFinish, (BaseMsg msg) =>
        {
            Debug.Log("更新完成");
            MessageCenter.Remove(MsgEnum.ABLoadingFinish);
        });
        MessageCenter.Add(MsgEnum.RunLua, (BaseMsg msg) =>
        {
            Debug.Log("开始执行Lua的Main脚本");
            Destroy(text.gameObject);
            Destroy(slider.gameObject);
            MessageCenter.Remove(MsgEnum.RunLua);
        });

        //启动框架
        LuaMain.Instance.StartFramework();
    }
}
