--主入口函数。从这里开始lua逻辑

require "define"
require "global"
require "utils"
require "tween"

ControlCenter = require "Common.ControlCenter.ControlCenter"

function Main()
    Destroy(GameObject.Find("CanvasLoadAB"))

    ControlCenter.init()

    local CanvasPreload = require "Common.CanvasPreload"
    CanvasPreload:new()
end

--场景切换通知
function OnLevelWasLoaded(level)
    collectgarbage("collect")
    Time.timeSinceLevelLoad = 0
end

function OnApplicationQuit()
end
