--[[
队列用法：
    require "queue"
    local myQueue = Queue:new()
    Queue.Push(myQueue, 1)
    Queue.Push(myQueue, 2)
    Log(Queue.Pop(myQueue))
    Log(Queue.Pop(myQueue))
]]

Queue = {}

function Queue.New()
    return {first = 0, last = -1}
end

function Queue.Push(queue, value)
    local last = queue.last + 1
    queue.last = last
    queue[last] = value
end

function Queue.Pop(queue)
    local first = queue.first
    if first > queue.last then
        return nil
    end
    local value = queue[first]
    queue[first] = nil
    queue.first = first + 1
    return value
end

function Queue.IsEmpty(queue)
    if not queue then
        return true
    end
    local first = queue.first
    if first > queue.last then
        return true
    end
    return false
end