local BaseUI = require "Core.BaseUI"
local Register = Class("Register", BaseUI)

function Register:PrefabPath()
    return "Prefabs/Lobby/Login/Register"
end

function Register:Awake()
    self.super.Awake(self)

    local btnRegister = self.transform:Find("BtnRegister")
    btnRegister:OnClick(
        function()
            local alert = Module.Get(ModuleID.Common):OpenUI(1)
            alert:SetContent("暂未开发")
        end
    )

    local btnBack = self.transform:Find("BtnBack")
    btnBack:OnClick(
        function()
            CommandManager.Execute(CommandID.OpenUI, ModuleID.Login, 1)
        end
    )
end

return Register
