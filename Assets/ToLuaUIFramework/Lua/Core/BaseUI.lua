local LuaBehaviour = require "Core.LuaBehaviour"

local BaseUI = class("BaseUI", LuaBehaviour)

<<<<<<< HEAD
function BaseUI:ctor(prefabPath)
    -- body
=======
--由子类重写，设置物体生成时的父级节点，优先级高于new(parent)参数传入
function BaseUI:getParent()
    return GameObject.Find("MainCanvas").transform
>>>>>>> 2f466de6f8c744b093f60a0f696d8e5e25793d06
end

--由子类重写，在UI栈内被别的UI覆盖时是否隐藏自己
function BaseUI:keepActive()
    return true
end

--由子类重写，如果定义了浮动UI,则在UI栈内的下层UI将始终显示
function BaseUI:isFloat()
    return false
end

function BaseUI:createGameObject(parent)
    local customParent = self:getParent()
    if customParent then
        parent = customParent
    end
    local prefabPath = self:prefabPath()
    if prefabPath and prefabPath ~= "" then
        UIManager:SpawnUI(
            prefabPath,
            parent,
            function(go, _isSingletonActive)
                if self.ModuleId then
                    go:GetComponent("LuaBehaviour"):SetModuleId(self.ModuleId)
                end
                self:onGameObjectSpawn(go, _isSingletonActive)
            end,
            self:keepActive(),
            self:isFloat(),
            self:destroyABAfterSpawn(),
            self:destroyABAfterAllSpawnDestroy()
        )
    end
end

return BaseUI
