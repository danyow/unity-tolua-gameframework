ControlCenter = {}

local ctrlList = {
    require "LobbyUI.Login.CanvasLoginCtrl",
    require "LobbyUI.Lobby.MainLobbyCtrl"
}

function ControlCenter.init()
    for key, value in pairs(ctrlList) do
        value:new()
    end
end
