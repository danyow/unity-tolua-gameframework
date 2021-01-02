UIRegister = {}

local uiRequires = {}
local uis = {}

function onUIDestroy(_uiID)
    uis[_uiID] = nil
end

local function registerUI(uiID, uiRequire)
    uiRequires[uiID] = uiRequire
end

--所有需要发送命令打开的UI都须在此注册
function UIRegister.init()
    registerUI(UIID.ResPreload, require "ResPreload.ResPreload")
    registerUI(UIID.Login, require "LobbyUI.Login.Login")
    registerUI(UIID.LobbyMain, require "LobbyUI.Lobby.LobbyMain")
    registerUI(UIID.PlayerInfo, require "LobbyUI.PlayerInfo.PlayerInfo")
    registerUI(UIID.Shop, require "LobbyUI.Shop.Shop")
    registerUI(UIID.RoomSelect, require "LobbyUI.RoomSelect.RoomSelect")
    registerUI(UIID.Alert, require "Common.Alert")
    registerUI(UIID.Battle, require "Battle.UI.Fight")
end

function UIRegister.register()
    CommandManager.add(
        CommandID.OpenUI,
        function(uiID)
            local _uiID = tonumber(uiID)
            local ui = uis[_uiID]
            if not ui then
                ui = uiRequires[_uiID]:new(_uiID)
                uis[_uiID] = ui
            else
                ui:createGameObject(_uiID)
            end
        end
    )
end

return UIRegister
