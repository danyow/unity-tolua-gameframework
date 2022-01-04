--打开模块UI
function OpenModuleUI(moduleName, uiKey, parent)
    Modules[moduleName]:OpenUI(uiKey, parent)
end


--关闭模块UI
function CloseModuleUI(moduleName, uiKey, parent)
    Modules[moduleName]:CloseUI(uiKey, parent)
end

--设置A服信息
function SetServerAInfo(url, key, clientTime, serverTime)
    Global.serverA = Global.serverA or {}
    Global.serverA.url = url
    Global.serverA.key = key
    Global.serverA.clientTime = clientTime
    Global.serverA.serverTime = serverTime
end

--设置P服信息
function SetServerPInfo(url, key, clientTime, serverTime)
    Global.serverP = Global.serverP or {}
    Global.serverP.url = url
    Global.serverP.key = key
    Global.serverP.clientTime = clientTime
    Global.serverP.serverTime = serverTime
end

--设置M服信息
function SetServerMInfo(url, key, clientTime, serverTime)
    Global.serverM = Global.serverM or {}
    Global.serverM.url = url
    Global.serverM.key = key
    Global.serverM.clientTime = clientTime
    Global.serverM.serverTime = serverTime
end

--收到游戏服广播推送
function OnTcpBroadcast(protoId, s2c)
    EventManager.Emit(EventID.TcpBroadcast, protoId, s2c)
end

function TriggerEvent(eventid,...)
    EventManager.Emit(eventid,...)
end
