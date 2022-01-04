CommandManager = {}

--两个队列交替使用，以防止执行过程中有消息变动
local listenerGroups = {}
local queue = nil

local function mainThreadUpdate()
    while not Queue.IsEmpty(queue) do
        local command = Queue.Pop(queue)
        local listeners = listenerGroups[command.id]
        if listeners then
            for key, value in pairs(listeners) do
                local paramsCount = #command.params
                if paramsCount == 0 then
                    if value.self then
                        value.listener(value.self)
                    else
                        value.listener()
                    end
                elseif paramsCount == 1 then
                    if value.self then
                        value.listener(value.self, command.params[1])
                    else
                        value.listener(command.params[1])
                    end
                elseif paramsCount == 2 then
                    if value.self then
                        value.listener(value.self, command.params[1], command.params[2])
                    else
                        value.listener(command.params[1], command.params[2])
                    end
                elseif paramsCount == 3 then
                    if value.self then
                        value.listener(value.self, command.params[1], command.params[2], command.params[3])
                    else
                        value.listener(command.params[1], command.params[2], command.params[3])
                    end
                elseif paramsCount == 4 then
                    if value.self then
                        value.listener(
                            value.self,
                            command.params[1],
                            command.params[2],
                            command.params[3],
                            command.params[4]
                        )
                    else
                        value.listener(command.params[1], command.params[2], command.params[3], command.params[4])
                    end
                elseif paramsCount == 5 then
                    if value.self then
                        value.listener(
                            value.self,
                            command.params[1],
                            command.params[2],
                            command.params[3],
                            command.params[4],
                            command.params[5]
                        )
                    else
                        value.listener(
                            command.params[1],
                            command.params[2],
                            command.params[3],
                            command.params[4],
                            command.params[5]
                        )
                    end
                end
            end
        end
    end
end

UpdateBeat:AddListener(UpdateBeat:CreateListener(mainThreadUpdate))

function CommandManager.Add(id, listener, self)
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

function CommandManager.Remove(id, listener, self)
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

--执行命令(一般用于系统逻辑命令传递，若是用户触发事件，请使用事件管理器 EventManager)
function CommandManager.Execute(id, ...)
    local params = ""
    for key, value in pairs({...}) do
        if params ~= "" then
            params = params .. "|"
        end
        params = params .. tostring(value)
    end
    if params == "" then
        Log("{id=" .. id .. "}", "执行命令")
    else
        Log("{id=" .. id .. ", params=" .. params .. "}", "执行命令")
    end
    local listeners = listenerGroups[id]
    if not listeners then
        return
    end
    if not queue then
        queue = Queue.New()
    end
    Queue.Push(queue, {id = id, params = {...}})
end
