local function pairsEx(tbl)
    local meta = getmetatable(tbl)
    if meta then
        for key, value in pairs(meta) do
            if key == "__pairs" then
                return meta.__pairs(tbl)
            end
        end
    end
    return pairs(tbl)
end

local function isMetatable(data)
    local meta = getmetatable(data)
    if meta then
        for key, value in pairs(meta) do
            if key == "__pairs" then
                return true
            end
        end
    end
    return false
end

local function isLuaClass(data)
    if type(data) == "table" then
        for key, value in pairs(data) do
            if type(value) == "function" then
                return true
            end
            if type(value) == "table" then
                for k, v in pairs(value) do
                    if type(v) == "function" then
                        return true
                    end
                end
            end
        end
    end
    return false
end

function dataToJson(data, depth)
    if data == nil then
        return "nil"
    end
    depth = depth + 1
    if depth > 8 then
        return tostring(data)
    end
    if isLuaClass(data) then
        if data.__cname then
            return "class(" .. data.__cname .. ")"
        end
        return tostring(data)
    end
    if type(data) == "table" or isMetatable(data) then
        local str = "{"
        for key, value in pairsEx(data) do
            if str ~= "{" then
                str = str .. ","
            end
            str = str .. '"' .. key .. '"' .. ":" .. dataToJson(value, depth)
        end
        return str .. "}"
    elseif type(data) == "string" then
        return '"' .. tostring(data) .. '"'
    else
        return tostring(data)
    end
end

local function _log(data, method, tag)
    local func = Debugger.Log
    if method == 2 then
        func = Debugger.LogWarning
    end
    if method == 3 then
        func = Debugger.LogError
    end
    local depth = 1
    local str = dataToJson(data, depth)
    if tag then
        func("WQB=> [" .. tag .. "]=> " .. str .. "\n" .. debug.traceback())
    else
        func("WQB=> " .. str .. "\n" .. debug.traceback())
    end
end

function log(data, tag)
    _log(data, 1, tag)
end

function logWarning(data, tag)
    _log(data, 2, tag)
end

function logError(data, tag)
    _log(data, 3, tag)
end

function logTimestamp(timestamp, addPrefix)
    log(timestampToDate(timestamp, addPrefix))
end

function timestampToDate(timestamp, addPrefix)
    if not addPrefix then
        addPrefix = false
    end
    if addPrefix then
        return os.date("! %y年%m月%d日%H时%M分%S秒", timestamp)
    else
        return os.date("%y年%m月%d日%H时%M分%S秒", timestamp)
    end
end