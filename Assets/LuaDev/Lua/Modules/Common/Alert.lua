local BaseUI = require "Core.BaseUI"

local Alert = Class("Alert", BaseUI)

function Alert:PrefabPath()
    return "Prefabs/Common/Alert"
end

function Alert:IsFloat()
    return true
end

function Alert:Awake()
    self.super.Awake(self)

    self.openTime = Time.time

    self.updateHandler = UpdateBeat:CreateListener(self.Update, self)
    self.dialog = self.transform:Find("Dialog")
    self.content = self.dialog:Find("Text"):GetComponent("Text")
end

function Alert:OnEnable()
    self.super.OnEnable(self)

    UpdateBeat:AddListener(self.updateHandler)

    --黑色蒙版动画
    self.transform:DOAlpha(0, 0.5, 0.3, Ease.OutSine, false)

    --小对话框动画
    self.dialog.localScale = Vector3.one * 0.5
    self.dialog:DOScale(Vector3.one, 0.3):SetEase(Ease.OutBack)
end

--外部调用
function Alert:SetContent(text)
    self.content.text = text
end

function Alert:OnDisable()
    self.super.OnDisable(self)

    UpdateBeat:RemoveListener(self.updateHandler)
end

function Alert:Update()
    if Input.GetMouseButtonUp(0) then
        --鼠标放开时触发，错开点击按钮打开本页的冲突，否则打开同时又会触发关闭
        if Time.time > self.openTime + 0.2 then
            Destroy(self.gameObject)
        end
    end
end

return Alert
