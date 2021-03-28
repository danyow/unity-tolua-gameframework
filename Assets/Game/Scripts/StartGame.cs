using ToLuaUIFramework;
using UnityEngine;
using UnityEngine.UI;

public class StartGame : MonoBehaviour
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
        });
        MessageCenter.Add(MsgEnum.RunLuaMain, (BaseMsg msg) =>
        {
            Debug.Log("开始执行LuaMain脚本");
            Destroy(text.gameObject);
            Destroy(slider.gameObject);
        });

        //启动框架
        Main.Instance.StartFramework();
    }
}
