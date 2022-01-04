local BaseUI = require "Core.BaseUI"
local Shop = Class("Shop", BaseUI)

function Shop:PrefabPath()
    return "Prefabs/Lobby/Shop/Shop"
end

function Shop:Awake()
    self.super.Awake(self)
    local btnBack = self.transform:Find("BtnBack")
    btnBack:OnClick(
        function()
            Destroy(self.gameObject)
        end
    )
end

return Shop
