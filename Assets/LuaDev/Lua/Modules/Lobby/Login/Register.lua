local BaseUI = require "Core.BaseUI"
local Register = Class("Register", BaseUI)

function Register:prefabPath()
    return "Prefabs/Lobby/Login/Register"
end

function Register:onAwake()
    self.super.onAwake(self)

    local btnRegister = self.transform:Find("BtnRegister")
    btnRegister:OnClick(
        function()
            local alert = Module.get(ModuleID.Common):openUI(1)
            alert:setContent("暂未开发")
        end
    )

    local btnBack = self.transform:Find("BtnBack")
    btnBack:OnClick(
        function()
            CommandManager.execute(CommandID.OpenUI, ModuleID.Login, 1)
        end
    )
end

return Register
