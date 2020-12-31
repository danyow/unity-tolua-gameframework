local BaseUI = require "Core.BaseUI"
local Fight = class("Fight", BaseUI)

function Fight:prefabPath()
    return "Prefabs/Battle/UI/Fight"
end

function Fight:onAwake()
    local btnBack = self.transform:Find("Panel/BtnBack")
    UIEventManager.SetButtonClick(
        btnBack,
        function()
            Destroy(self.gameObject)
            CommandManager.execute(CommandID.OpenUI, UIID.LobbyMain)
        end
    )
end

return Fight
