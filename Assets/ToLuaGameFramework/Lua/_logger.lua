--creatr by wuqibo
--2020.11.26
--以json数据的形式打印对象，支持绝大多数数据类型

G_IS_OPEN_LOG = true

local function _pairsEx(tbl)
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

local function _isMetatable(data)
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

local function _isLuaClass(data)
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

local function _dataToJson(data)
    if data == nil then
        return "nil"
    end
    if _isLuaClass(data) then
        if data.__cname then
            return "class(" .. data.__cname .. ")"
        end
        return tostring(data)
    end
    if type(data) == "table" or _isMetatable(data) then
        local str = "{"
        for key, value in _pairsEx(data) do
            if str ~= "{" then
                str = str .. ","
            end
            if type(key) == "table" then
                key = "Key type is table"
            end
            str = str .. '"' .. key .. '"' .. ":" .. _dataToJson(value)
        end
        return str .. "}"
    elseif type(data) == "number" then
        return tostring(data)
    else
        if data ~= nil and type(data) == "userdata" and (data.Equals and data:Equals(nil)) then
            return '"nil"'
        else
            local valueStr = tostring(data)
            if string.sub(valueStr, 1, 1) == "[" then
                return valueStr
            else
                return '"' .. valueStr .. '"'
            end
        end
    end
end

local function _log(method, ...)
    local func = Debugger.Log
    if method == 2 then
        func = Debugger.LogWarning
    end
    if method == 3 then
        func = Debugger.LogError
    end
    local content = ""
    local datas = {...}
    for key, data in pairs(datas) do
        content = content .. " " .. _dataToJson(data)
    end
    if G_IS_EDITOR or method == 3 then
        content = content .. "\n" .. debug.traceback()
    end
    if method == 3 then
        func("[Error]" .. content)
    else
        func("[Info]" .. content)
    end
end

function Log(...)
    if not G_IS_OPEN_LOG then
        return
    end
    _log(1, ...)
end

function LogWarning(...)
    if not G_IS_OPEN_LOG then
        return
    end
    _log(2, ...)
end

function LogError(...)
    if G_IS_EDITOR then
        _log(3, ...)
    else
        _log(1, ...)
    end
end