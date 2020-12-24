local BaseUI = require "Base.BaseUI"

local CanvasRoom = class("CanvasRoom", BaseUI)

function CanvasRoom:getPrefabPath()
    return "Prefabs/UI/Room/CanvasRoom"
end

function CanvasRoom:onAwake()
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
                print("进入房间："..param)
                local CanvasFight = require "UI.Fight.CanvasFight"
                CanvasFight:new()
            end,
            i
        )
    end
end

return CanvasRoom
