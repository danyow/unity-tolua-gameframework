local BaseUI = require "Core.BaseUI"
local Register = Class("Register", BaseUI)

function Register:PrefabPath()
    return "Prefabs/Login/Register"
end

function Register:Awake()
    self.super.Awake(self)

    local btnRegister = self.transform:Find("BtnRegister")
    btnRegister:OnClick(
        function()
            local alert = Modules.Common:OpenUI("Alert")
            alert:SetContent("暂未开发")
        end
    )

    local btnBack = self.transform:Find("BtnBack")
    btnBack:OnClick(
        function()
            CommandManager.Execute(CommandID.OpenUI, "LoginMgr", "Login")
        end
    )
end

return Register
