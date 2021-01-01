UIRegister = {}

local uiRequires = {}

local function RegisterUI(uiID, uiRequire)
    uiRequires[uiID] = uiRequire
end

--所有需要发送命令打开的UI都须在此注册
function UIRegister.init()
    RegisterUI(UIID.ResPreload, require "Common.ResPreload")
    RegisterUI(UIID.Login, require "LobbyUI.Login.Login")
    RegisterUI(UIID.LobbyMain, require "LobbyUI.Lobby.LobbyMain")
    RegisterUI(UIID.PlayerInfo, require "LobbyUI.PlayerInfo.PlayerInfo")
    RegisterUI(UIID.Shop, require "LobbyUI.Shop.Shop")
    RegisterUI(UIID.RoomSelect, require "LobbyUI.RoomSelect.RoomSelect")
    RegisterUI(UIID.Alert, require "Common.Alert")
    RegisterUI(UIID.Battle, require "Battle.UI.Fight")
end

function UIRegister.register()
    CommandManager.add(
        CommandID.OpenUI,
        function(uiID)
            local uiRequire = uiRequires[uiID]
            if uiRequire then
                uiRequire:new()
            end
        end
    )
end

return UIRegister
