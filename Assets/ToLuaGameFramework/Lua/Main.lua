--主入口函数。从这里开始lua逻辑

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

--require "Samples.Enum"
--require "Samples.Module"
require "Define.Requires"
require "Define.Enum"
require "Define.Define"
require "Define.Modules"
require "CSharpBridge"

function Main()
    --正常实例化UI，不用命令打开UI
    local PreloadUI = require "Modules.ResPreload.ResPreload"
    local parent = GameObject.Find("MainCanvas").transform
    PreloadUI:New(parent)
end

--场景切换通知
function OnLevelWasLoaded(level)
    collectgarbage("collect")
    Time.timeSinceLevelLoad = 0
end

function OnApplicationQuit()
end
