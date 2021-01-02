local LuaBehaviour = require "Core.LuaBehaviour"

local BaseUI = class("BaseUI", LuaBehaviour)

--由子类重写，在UI栈内被别的UI覆盖时是否隐藏自己
function BaseUI:keepActive()
    return false
end

--由子类重写，如果定义了浮动UI,则在UI栈内的下层UI将始终显示
function BaseUI:isFloat()
    return false
end

function BaseUI:createGameObject(uiID)
    self.uiID = uiID
    local prefabPath = self:prefabPath()
    UIManager:SpawnUI(
        prefabPath,
        nil,
        function(go, isSingletonActiveCallback)
            if not isSingletonActiveCallback then
                local csharpLuaBehaviour = go:GetComponent("LuaBehaviour")
                csharpLuaBehaviour:SetUIID(self.uiID)
            end
            self:onGameObjectCreated(go, isSingletonActiveCallback)
        end,
        self:keepActive(),
        self:isFloat(),
        self:destroyABAfterSpawn(),
        self:destroyABAfterAllSpawnDestroy()
    )
end

return BaseUI
