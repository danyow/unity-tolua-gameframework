local function pairsEx(tbl)
    local meta = getmetatable(tbl)
    if meta and meta.__pairs then
        return meta.__pairs(tbl)
    end
    return pairs(tbl)
end

function tableToJson(t)
    if t == nil then
        return "nil"
    end
    if type(t) == "number" then
        return tostring(t)
    elseif type(t) == "string" then
        return '"' .. tostring(t) .. '"'
    elseif type(t) == "userdata" then
        return tostring(t)
    else
        local str = "{"
        for key, value in pairsEx(t) do
            if str ~= "{" then
                str = str .. ","
            end
            str = str .. '"' .. key .. '"' .. ":" .. tableToJson(value)
        end
        return str .. "}"
    end
end

local function _log(value, method, tag)
    local func = Debugger.Log
    if method == 2 then
        func = Debugger.LogWarning
    end
    if method == 3 then
        func = Debugger.LogError
    end
    local str = tableToJson(value)
    if tag then
        func("WQB=> [" .. tag .. "]=> " .. str .. "\n" .. debug.traceback())
    else
        func("WQB=> " .. str .. "\n" .. debug.traceback())
    end
end

function log(value, tag)
    _log(value, 1, tag)
end

function logWarning(value, tag)
    _log(value, 2, tag)
end

function logError(value, tag)
    _log(value, 3, tag)
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