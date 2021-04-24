--[[
队列用法：
    require "queue"
    local myQueue = Queue:new()
    Queue.push(myQueue, 1)
    Queue.push(myQueue, 2)
    Log(Queue.pop(myQueue))
    Log(Queue.pop(myQueue))
]]

Queue = {}

function Queue.new()
    return {first = 0, last = -1}
end

function Queue.push(queue, value)
    local last = queue.last + 1
    queue.last = last
    queue[last] = value
end

function Queue.pop(queue)
    local first = queue.first
    if first > queue.last then
        return nil
    end
    local value = queue[first]
    queue[first] = nil
    queue.first = first + 1
    return value
end

function Queue.isEmpty(queue)
    if not queue then
        return true
    end
    local first = queue.first
    if first > queue.last then
        return true
    end
    return false
end