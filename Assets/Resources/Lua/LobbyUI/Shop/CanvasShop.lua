local BaseUI = require "Core.BaseUI"

local CanvasShop = class("CanvasShop", BaseUI)

function CanvasShop:getPrefabPath()
    return "Prefabs/LobbyUI/Shop/CanvasShop"
end

function CanvasShop:onAwake()
    local btnBack = self.transform:Find("Panel/BtnBack")
    UIEventManager.SetButtonClick(
        btnBack,
        function()
            Destroy(self.gameObject)
        end
    )
end

return CanvasShop
