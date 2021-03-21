local LuaBehaviour = require "Core.LuaBehaviour"

local BaseUI = class("BaseUI", LuaBehaviour)

--由子类重写，是否加入Ui栈策略
function BaseUI:isUIStack()
    return true
end

--由子类重写，在UI栈内被别的UI覆盖时是否隐藏自己
function BaseUI:keepActive()
    return false
end

--由子类重写，如果定义了浮动UI,则在UI栈内的下层UI将始终显示
function BaseUI:isFloat()
    return false
end

function BaseUI:createGameObject(parent)
    local prefabPath = self:prefabPath()
    if not prefabPath or prefabPath == "" then
        LogError("请重写prefabPath()方法并指定Prefab路径")
        return
    end
    local go =
        UIManager.SpawnUI(
        prefabPath,
        parent,
        self:isUIStack(),
        self:keepActive(),
        self:isFloat(),
        self:destroyABAfterSpawn(),
        self:destroyABAfterAllSpawnDestroy()
    )
    self:onGameObjectSpawn(go)
end

return BaseUI
