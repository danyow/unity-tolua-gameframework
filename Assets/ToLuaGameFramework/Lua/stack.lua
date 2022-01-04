--[[
栈用法：
    require "stack"
    local myStack = Stack:new()
    Stack.push(myStack, 1)
    Stack.push(myStack, 2)
    Log(Stack.Pop(myStack))
    Log(Stack.Pop(myStack))
]]

Stack = {}

function Stack.New()
    return {first = 0, last = -1}
end

function Stack.push(stack, value)
    local last = stack.last + 1
    stack.last = last
    stack[last] = value
end

function Stack.Pop(stack)
    local last = stack.last
    if stack.first > last then
        return nil
    end
    local value = stack[last]
    stack[last] = nil
    stack.last = last - 1
    return value
end

function Stack.IsEmpty(stack)
    if not stack then
        return true
    end
    local last = stack.last
    if stack.first > last then
        return true
    end
    return false
end