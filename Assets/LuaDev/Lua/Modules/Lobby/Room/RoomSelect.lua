local BaseUI = require "Core.BaseUI"
local RoomSelect = Class("RoomSelect", BaseUI)

function RoomSelect:PrefabPath()
    return "Prefabs/Lobby/Room/RoomSelect"
end

function RoomSelect:Awake()
    self.super.Awake(self)
    local btnBack = self.transform:Find("BtnBack")
    btnBack:OnClick(
        function()
            Destroy(self.gameObject)
        end
    )

    for i = 1, 3, 1 do
        local btnRoom = self.transform:Find("BtnRoom" .. i)
        btnRoom:OnClick(
            i,
            function(param)
                Log(param)
                print("进入战场：" .. param)
                Destroy(self.gameObject)
                Module.Get(ModuleID.Battle):OpenUI(1, nil)
            end
        )
    end
end

return RoomSelect
