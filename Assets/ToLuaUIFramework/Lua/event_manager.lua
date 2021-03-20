EventManager = {}

local listenerGroups = {}

function EventManager.add(id, listener, self)
    local listeners = listenerGroups[id]
    if not listeners then
        listeners = {}
        listenerGroups[id] = listeners
    end
    if self then
        for key, value in pairs(listeners) do
            if value.listener == listener and value.self == self then
                return false
            end
        end
    end
    Log(listeners)
    if self then
        table.insert(listeners, {self = self, listener = listener})
    else
        table.insert(listeners, {listener = listener})
    end
    Log(listeners)
end

function EventManager.remove(id, listener)
    local listeners = listenerGroups[id]
    if not listeners then
        return
    end
    for key, value in pairs(listeners) do
        if value.listener == listener then
            table.remove(listeners, key)
        end
    end
end

--事件触发（推荐只能用于用户触发，若是系统逻辑触发，请使用消息管理器 CommandManager）
function EventManager.emit(id, ...)
    Log("00000000000000")
    local listeners = listenerGroups[id]
    Log(listeners)
    if not listeners then
        return
    end
    Log("11111111111")
    for key, value in pairs(listeners) do
        if value.self then
            Log("22222222222")
            value.listener(value.self, ...)
        else
            Log("333333333333")
            value.listener(...)
        end
    end
end
