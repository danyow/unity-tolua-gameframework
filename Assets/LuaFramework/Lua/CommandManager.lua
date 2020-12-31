CommandManager = {}

--两个队列交替使用，以防止执行过程中有消息变动
local msgListeners = {}
local queue = {}
local queue2 = {}

local function getCmdIndex(id, listener)
    if msgListeners[id] == nil then
        return -1
    end
    for i = 1, #msgListeners[id] do
        if msgListeners[id][i].listener == listener then
            return i
        end
    end
    return -1
end

local function mainThreadUpdate()
    while queue[1] do
        queue, queue2 = queue2, queue
        for i = 1, #queue2 do
            local dispatchMsg = queue2[i]
            for key, value in pairs(msgListeners[dispatchMsg.id]) do
                if value.self then
                    value.listener(value.self, dispatchMsg.param)
                else
                    value.listener(dispatchMsg.param)
                end
            end
            queue2[i] = nil
        end
    end
end

UpdateBeat:AddListener(UpdateBeat:CreateListener(mainThreadUpdate))

function CommandManager.addCommand(id, listener, self)
    local index = 1
    if msgListeners[id] == nil then
        msgListeners[id] = {}
    else
        local existIndex = getCmdIndex(id, listener)
        if existIndex ~= -1 then
            return
        end
        index = #msgListeners[id] + 1
    end
    if self then
        msgListeners[id][index] = {self = self, listener = listener}
    else
        msgListeners[id][index] = {listener = listener}
    end
end

function CommandManager.removeCommand(id, listener)
    if msgListeners[id] == nil then
        return
    end
    local existIndex = getCmdIndex(id, listener)
    if existIndex == -1 then
        return
    end
    table.remove(msgListeners[id], existIndex)
end

--执行命令(一般用于系统逻辑命令传递，若是用户触发事件，请使用事件管理器 EventManager)
function CommandManager.execute(id, param)
    if msgListeners[id] == nil then
        return
    end
    table.insert(queue, {id = id, param = param})
end

return CommandManager
