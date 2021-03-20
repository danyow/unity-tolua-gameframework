--[[
ModuleRegister = {}

local uiRequires = {}
local uis = {}
local hadRegister = false

function ModuleRegister.init()
    if not hadRegister then
        local uilist = require "Common.UIRegisterList"
        for key, value in pairs(uilist) do
            uiRequires[key] = value
        end
        hadRegister = true
    end
end

function ModuleRegister.register()
    CommandManager.add(
        CommandID.OpenUI,
        function(ModuleId)
            local _ModuleId = tonumber(ModuleId)
            local ui = uis[_ModuleId]
            if not ui then
                ui = uiRequires[_ModuleId]:new()
                if ui.transform then
                    ui.transform:GetComponent("LuaBehaviour"):SetModuleId(_ModuleId)
                else
                    ui.ModuleId = _ModuleId
                end
                uis[_ModuleId] = ui
            else
                ui:createGameObject()
            end
        end
    )
end

function onUIDestroy(_ModuleId)
    uis[_ModuleId] = nil
end

return ModuleRegister
]]