local CommandManager = {}

--两个队列交替使用，以防止执行过程中有消息变动
local listenerGroups = {}
local queue = nil

local function mainThreadUpdate()
    while not Queue.isEmpty(queue) do
        local command = Queue.pop(queue)
        local listeners = listenerGroups[command.id]
        if listeners then
            for key, value in pairs(listeners) do
                if value.self then
                    value.listener(value.self, command.params)
                else
                    value.listener(command.params)
                end
            end
        end
    end
end

UpdateBeat:AddListener(UpdateBeat:CreateListener(mainThreadUpdate))

function CommandManager.add(id, listener, self)
    local listeners = listenerGroups[id]
    if not listeners then
        listeners = {}
        table.insert(listenerGroups, listeners)
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

function CommandManager.remove(id, listener)
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

--执行命令(一般用于系统逻辑命令传递，若是用户触发事件，请使用事件管理器 EventManager)
function CommandManager.execute(id, ...)
    local listeners = listenerGroups[id]
    if not listeners then
        return
    end
    if not queue then
        queue = Queue.new()
    end
    Queue.push(queue, {id = id, params = ...})
end

return CommandManager
