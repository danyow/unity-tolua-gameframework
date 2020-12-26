local BaseUI = require "Base.BaseUI"

local CanvasPreload = class("CanvasPreload", BaseUI)

function CanvasPreload:getPrefabPath()
    return "Prefabs/Common/CanvasPreload"
end

function CanvasPreload:onAwake()
    self.slider = self.transform:Find("Panel/Slider"):GetComponent("Slider")
    self.slider.value = 0
end

function CanvasPreload:onStart()
    local paths = {
        "Assets/Resources/Prefabs/LobbyUI"
    }
    ResManager:PreloadLocalAssetBundles(
        paths,
        function(progress)
            self.slider.value = progress
            if progress == 1 then
                Destroy(self.gameObject)
                local CanvasLogin = require "LobbyUI.Login.CanvasLogin"
                CanvasLogin:new()
            end
        end
    )
end

return CanvasPreload
