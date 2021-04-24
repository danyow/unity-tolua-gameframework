local BaseUI = require "Core.BaseUI"
local Shop = Class("Shop", BaseUI)

function Shop:prefabPath()
    return "Prefabs/Lobby/Shop/Shop"
end

function Shop:onAwake()
    self.super.onAwake(self)
    local btnBack = self.transform:Find("BtnBack")
    btnBack:OnClick(
        function()
            Destroy(self.gameObject)
        end
    )
end

return Shop
