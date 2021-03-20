--主入口函数。从这里开始lua逻辑

require "logger"
require "define"
require "command_manager"
require "event_manager"
require "functions"
require "utils"
require "dotween"
require "btween"
require "queue"
require "stack"

require "Core.Define"

local moduleInstanceList = {}
Module = {}

function Main()
    --所有注册的模块初始化
    local registerList = require "Core.ModuleRegister"
    for key, value in pairs(registerList) do
        local m = value:new()
        m.moduleId = key
        moduleInstanceList[key] = m
    end

    --开始打开第一个模块
    Destroy(GameObject.Find("CanvasLoadAB"))

    --正常实例化UI，不用命令打开UI
    local PreloadUI = require "Modules.ResPreload.ResPreload"
    PreloadUI:new()
    --local parent = GameObject.Find("MainCanvas").transform
    --PreloadUI:new(parent))
end

--根据ID获取模块
function Module.get(moduleId)
    return moduleInstanceList[moduleId]
end

--场景切换通知
function OnLevelWasLoaded(level)
    collectgarbage("collect")
    Time.timeSinceLevelLoad = 0
end

function OnApplicationQuit()
end
