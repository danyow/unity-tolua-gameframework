local BaseUI = require "Core.BaseUI"
local Register = class("Register", BaseUI)

function Register:prefabPath()
    return "Prefabs/Lobby/Login/Register"
end

function Register:onAwake()
    self.super.onAwake(self)

    local btnRegister = self.transform:Find("BtnRegister")
    btnRegister:OnClick(
        function()
            Log("功能暂未实现")
        end
    )

    local btnBack = self.transform:Find("BtnBack")
    btnBack:OnClick(
        function()
            CommandManager.execute(CommandID.OpenUI, ModuleId.Login, 1)
        end
    )
end

return Register
