local BaseUI = require "Core.BaseUI"

local PlayerInfo = class("PlayerInfo", BaseUI)

function PlayerInfo:prefabPath()
    return "Prefabs/LobbyUI/PlayerInfo/PlayerInfo"
end

function PlayerInfo:onAwake()
    local btnBack = self.transform:Find("Panel/BtnBack")
    UIEventManager.SetButtonClick(
        btnBack,
        function()
            Destroy(self.gameObject)
        end
    )
end

function PlayerInfo:isFloat()
    return true
end

return PlayerInfo
