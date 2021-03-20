local BaseUI = require "Core.BaseUI"
local FightUI = class("FightUI", BaseUI)

function FightUI:prefabPath()
    return "Prefabs/Battle/UI/FightUI"
end

function FightUI:parentName()
    return nil
end

function FightUI:onAwake()
    local btnBack = self.transform:Find("Panel/BtnBack")
    btnBack:OnClick(
        function()
            Destroy(self.gameObject)
        end
    )
end

return FightUI
