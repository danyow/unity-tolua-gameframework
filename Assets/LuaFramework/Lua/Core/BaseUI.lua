local LuaBehaviour = require "Core.LuaBehaviour"

local BaseUI = class("BaseUI", LuaBehaviour)

--由子类重写，在UI栈内被别的UI覆盖时是否隐藏自己
function LuaBehaviour:keepActive()
    return false
end

--由子类重写，如果定义了浮动UI,则在UI栈内的下层UI将始终显示
function LuaBehaviour:isFloat()
    return false
end

function LuaBehaviour:createGameObject(parent)
    local prefabPath = self:getPrefabPath()
    UIManager:SpawnUI(
        prefabPath,
        parent,
        function(go)
            self:onGameObjectCreated(go)
        end,
        self:keepActive(),
        self:isFloat(),
        self:destroyABAfterSpawn(),
        self:destroyABAfterAllSpawnDestroy()
    )
end

return BaseUI
