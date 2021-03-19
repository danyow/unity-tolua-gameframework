--主入口函数。从这里开始lua逻辑

require "logger"
require "define"
require "functions"
require "utils"
require "dotween"
require "btween"

require "Core.Define"
ModuleRegister = require "Core.ModuleRegister"

function Main()
    --所有注册的模块初始化
    ModuleRegister.init()

    --开始打开第一个模块
    Destroy(GameObject.Find("CanvasLoadAB"))

    --正常实例化UI，不用命令打开UI
    local PreloadUI = require "Modules.ResPreload.ResPreload"
    PreloadUI:new(GameObject.Find("MainCanvas").transform)
end

--场景切换通知
function OnLevelWasLoaded(level)
    collectgarbage("collect")
    Time.timeSinceLevelLoad = 0
end

function OnApplicationQuit()
end
