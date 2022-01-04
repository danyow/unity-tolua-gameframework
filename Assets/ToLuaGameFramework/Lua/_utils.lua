-- 金额国际化：123456789.5 转成 123,456,789.5
function NumberFormat(numTmp)
    local resultNum = numTmp
    if type(resultNum) == "userdata" then
        --C#的long型需要先转成string才能转number
        resultNum = tostring(resultNum)
    end
    if type(resultNum) == "string" then
        resultNum = tonumber(resultNum)
    end
    if resultNum then
        local inter, point = math.modf(resultNum)
        local strNum = tostring(inter)
        local newStr = ""
        local numLen = string.len(strNum)
        local count = 0
        for i = numLen, 1, -1 do
            if count % 3 == 0 and count ~= 0 then
                newStr = string.format("%s,%s", string.sub(strNum, i, i), newStr)
            else
                newStr = string.format("%s%s", string.sub(strNum, i, i), newStr)
            end
            count = count + 1
        end
        if point > 0 then
            local strPoint = string.format("%.2f", point)
            resultNum = string.format("%s%s", newStr, string.sub(strPoint, 2, string.len(strPoint)))
        else
            resultNum = newStr
        end
        return resultNum
    end
    return numTmp
end
