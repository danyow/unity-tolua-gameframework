local BaseUI = require "Core.BaseUI"

local ResPreloadView = class("ResPreloadView", BaseUI)

function ResPreloadView:prefabPath()
    return "Prefabs/Common/ResPreload"
end

function ResPreloadView:onAwake()
    self.slider = self.transform:Find("Panel/Slider"):GetComponent("Slider")
    self.slider.value = 10
end

function ResPreloadView:onCallback(param)
    print("================================= onCallback: " .. param)
end

function ResPreloadView:onStart()
    local paths = {
        "Assets/Resources/Prefabs/LobbyUI"
    }
    ResManager:PreloadLocalAssetBundles(
        paths,
        function(progress)
            self.slider.value = progress
            if progress == 1 then
                Destroy(self.gameObject)
                CommandManager.execute(CommandID.OpenUI, UIID.Login)
            end
        end
    )
end

return ResPreloadView
