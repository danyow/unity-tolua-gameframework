local BaseUI = require "Core.BaseUI"
local ResPreload = class("ResPreload", BaseUI)

function ResPreload:prefabPath()
    return "Prefabs/Common/ResPreload"
end

function ResPreload:onAwake()
    self.super.onAwake(self)
    self.slider = self.transform:Find("Slider"):GetComponent("Slider")
end

function ResPreload:onStart()
    self.super.onStart(self)
    local preloadPrefabPaths = {
        "Prefabs/Lobby"
    }
    ResManager:PreloadLocalAssetBundles(
        preloadPrefabPaths,
        function(progress)
            self.slider.value = progress
            if progress == 1 then
                Destroy(self.gameObject)
                CommandManager.execute(CommandID.OpenUI, ModuleId.Login, 5)
            end
        end
    )
end

return ResPreload
