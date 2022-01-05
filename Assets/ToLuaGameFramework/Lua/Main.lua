--主入口函数(从这里开始lua逻辑)
require "_define"
require "_logger"
require "_utils"
require "_func"
require "command_manager"
require "event_manager"
require "dotween"
require "btween"
require "queue"
require "stack"

function Main()
    local StartGame = require "StartGame"
    StartGame.Run()
end

--场景切换通知
function OnLevelWasLoaded(level)
    collectgarbage("collect")
    Time.timeSinceLevelLoad = 0
end

function OnApplicationQuit()
end
