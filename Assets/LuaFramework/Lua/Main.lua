--主入口函数。从这里开始lua逻辑

require "define"
require "global"
require "utils"
require "tween"

require "Common.Define"
UIRegister = require "Common.UIRegister"

function Main()
    Destroy(GameObject.Find("CanvasLoadAB"))

    UIRegister.init()
    UIRegister.register()

    CommandManager.execute(CommandID.OpenUI, UIID.ResPreload)
end

--场景切换通知
function OnLevelWasLoaded(level)
    collectgarbage("collect")
    Time.timeSinceLevelLoad = 0
end

function OnApplicationQuit()
end
