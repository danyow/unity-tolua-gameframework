using ToLuaUIFramework;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class MainRootUI : MonoBehaviour
{
    public Text text;
    public Slider slider;
    private void Awake()
    {
        MessageManager.Add(MsgEnum.ABLoadingBegin, (BaseMsg eventData) =>
        {
            text.text = "正在更新资源";
            slider.value = 0;
        });
        MessageManager.Add(MsgEnum.ABLoadingError, (BaseMsg eventData) =>
        {
            text.text = eventData.args[0].ToString();
        });
        MessageManager.Add(MsgEnum.ABLoadingProgress, (BaseMsg eventData) =>
        {
            float progress = float.Parse(eventData.args[0].ToString());
            text.text = Mathf.FloorToInt(progress * 100) + "%";
            slider.value = progress;
        });
        MessageManager.Add(MsgEnum.ABLoadingFinish, (BaseMsg eventData) =>
        {
            text.text = "更新完成";
            slider.gameObject.SetActive(false);
        });

        Main.Instance.StartToLuaUIFramework();
    }

    void Update()
    {
        if (Input.GetMouseButtonDown(0))
        {
            SceneManager.LoadScene("Lobby");
        }
    }
}
