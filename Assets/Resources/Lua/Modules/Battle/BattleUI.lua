local BaseUI = require "Core.BaseUI"
local BattleUI = Class("BattleUI", BaseUI)

function BattleUI:prefabPath()
    return "Prefabs/Battle/BattleUI"
end

function BattleUI:onAwake()
    local btnBack = self.transform:Find("Panel/BtnBack")
    btnBack:OnClick(
        function()
            Destroy(self.gameObject)
        end
    )
end

return BattleUI
