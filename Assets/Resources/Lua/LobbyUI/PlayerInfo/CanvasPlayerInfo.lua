local BaseUI = require "Core.BaseUI"

local CanvasPlayerInfo = class("CanvasPlayerInfo", BaseUI)

function CanvasPlayerInfo:getPrefabPath()
    return "Prefabs/LobbyUI/PlayerInfo/CanvasPlayerInfo"
end

function CanvasPlayerInfo:onAwake()
    local btnBack = self.transform:Find("Panel/BtnBack")
    UIEventManager.SetButtonClick(
        btnBack,
        function()
            Destroy(self.gameObject)
        end
    )
end

function CanvasPlayerInfo:isFloat()
    return true
end

return CanvasPlayerInfo
