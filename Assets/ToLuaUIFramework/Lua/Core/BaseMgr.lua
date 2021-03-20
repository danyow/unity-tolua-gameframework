local BaseMgr = class("BaseMgr")

function BaseMgr:ctor()
    --self.moduleId在Main.lua初始化时自动赋值
    self.moduleId = 0
    CommandManager.add(CommandID.OpenUI, self.onReceiveOpenUICmd, self)
end

--子类在构造ctor()里调用添加UI类(子类构造加super)
function BaseMgr:addUI(index, ui)
    if not self._uiList then
        self._uiList = {}
    end
    for key, value in pairs(self._uiList) do
        if key == index then
            LogError("index(" .. index .. ")已存在", "addUI")
            return
        elseif value == ui then
            LogError("ui(" .. ui.__cname .. ")已存在", "addUI")
            return
        end
    end
    self._uiList[index] = ui
end

function BaseMgr:onReceiveOpenUICmd(moduleId, uiIndex, parent)
    if not self._uiList then
        return
    end
    if moduleId == self.moduleId then
        if not uiIndex then
            uiIndex = 1
        end
        local clazz = self._uiList[uiIndex]
        if clazz then
            if parent then
                clazz:new(parent)
            else
                clazz:new()
            end
        end
    end
end

return BaseMgr
