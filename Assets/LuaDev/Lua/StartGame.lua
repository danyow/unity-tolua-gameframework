require "Define.Requires"

local StartGame = {}

function StartGame.Run()

    --进入第一个游戏界面：预加载资源进度条
    local PreloadUI = require "Modules.ResPreload.ResPreload"
    local parent = GameObject.Find("MainCanvas").transform
    PreloadUI:New(parent)

end

return StartGame