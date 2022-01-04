EventManager = {}

local listenerGroups = {}

function EventManager.Add(id, listener, self)
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
    if self then
        table.insert(listeners, {self = self, listener = listener})
    else
        table.insert(listeners, {listener = listener})
    end
end

function EventManager.Remove(id, listener, self)
    if listener then
        if not self then
            LogError("仅移除特定ID的某个回调时必须传 self 作用域")
            return
        end
        local listeners = listenerGroups[id]
        if listeners then
            for i, value in pairs(listeners) do
                if value.listener == listener and value.self == self then
                    listeners[i] = nil
                end
            end
        end
    else
        listenerGroups[id] = nil
    end
end

--事件触发（推荐只能用于用户触发，若是系统逻辑触发，请使用消息管理器 CommandManager）
function EventManager.Emit(id, ...)
    local listeners = listenerGroups[id]
    if not listeners then
        return
    end
    for key, value in pairs(listeners) do
        if value.self then
            value.listener(value.self, ...)
        else
            value.listener(...)
        end
    end
end
