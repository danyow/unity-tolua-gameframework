local BaseUI = require "Core.BaseUI"

local RoomSelect = class("RoomSelect", BaseUI)

function RoomSelect:prefabPath()
    return "Prefabs/LobbyUI/RoomSelect/RoomSelect"
end

function RoomSelect:onAwake()
    local btnBack = self.transform:Find("Panel/BtnBack")
    UIEventManager.SetButtonClick(
        btnBack,
        function()
            Destroy(self.gameObject)
        end
    )

    for i = 1, 3, 1 do
        local btnRoom = self.transform:Find("Panel/BtnRoom" .. i)
        UIEventManager.SetButtonClick(
            btnRoom,
            function(param)
                print("进入战场："..param)
                CommandManager.execute(CommandID.OpenUI, UIID.Battle)
            end,
            i
        )
    end
end

return RoomSelect
