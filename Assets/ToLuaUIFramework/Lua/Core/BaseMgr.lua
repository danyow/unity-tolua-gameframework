local BaseMgr = class("BaseMgr")

function BaseMgr:ctor()
    self._uiList = {}
    self:requireUIs()
    CommandManager.add(CommandID.OpenUI, self.onReceiveOpenUICmd, self)
end

function BaseMgr:getModuleId()
    return ModuleId.Login
end

function BaseMgr:requireUIs()
end

function BaseMgr:addUI(index, ui)
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
    if moduleId == self:getModuleId() then
        if not uiIndex then
            uiIndex = 1
        end
        if parent then
            self._uiList[uiIndex]:new(parent)
        else
            self._uiList[uiIndex]:new()
        end
    end
end

return BaseMgr
