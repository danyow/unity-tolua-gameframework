local LuaBehaviour = require "Core.LuaBehaviour"
---@class BaseUI : LuaBehaviour
local BaseUI = Class("BaseUI", LuaBehaviour)

--由子类重写，是否加入Ui栈策略
function BaseUI:IsUIStack()
    return true
end

--由子类重写，在UI栈内被别的UI覆盖时是否隐藏自己
function BaseUI:KeepActive()
    return false
end

--由子类重写，如果定义了浮动UI,则在UI栈内的下层UI将始终显示
function BaseUI:IsFloat()
    return false
end

function BaseUI:CreateGameObject(parent)
    local prefabPath = self:PrefabPath()
    if not prefabPath or prefabPath == "" then
        LogError("请重写PrefabPath()方法并指定Prefab路径")
        return
    end
    if not parent then
        parent = self:GetParent()
    end
    local go =
        UIManager.SpawnUI(
        prefabPath,
        parent,
        self:IsUIStack(),
        self:KeepActive(),
        self:IsFloat(),
        self:DestroyABAfterSpawn(),
        self:DestroyABAfterAllSpawnDestroy()
    )
    self:OnGameObjectSpawn(go)
end

--浮动窗口底部弹起
function BaseUI:DialogMoveIn(dialog, black, duration)
    duration = duration or 0.3
    dialog.anchoredPosition = Vector2(0, -1000)
    dialog:DOAnchorPos(Vector2(0, 20), duration * 0.7):SetDelay(0.2):SetEase(Ease.OutSine):OnComplete(
        function()
            dialog:DOAnchorPos(Vector2.zero, duration * 0.3):SetEase(Ease.OutSine)
        end
    )

    if black then
        black:DOAlpha(0, false)
        black:DOAlpha(0.5, duration, Ease.Linear, false)
    end

    --防止点击穿透
    local eventTrigger = dialog:GetComponent("EventTrigger")
    if not eventTrigger then
        dialog.gameObject:AddComponent(typeof(EventTrigger))
    end
end

--浮动窗口中间放大
function BaseUI:DialogScaleIn(dialog, black, duration)
    duration = duration or 0.25
    dialog.localScale = Vector3(0.5, 0.5, 0.5)
    dialog:DOScale(Vector3.one, duration):SetEase(Ease.OutBack)

    if black then
        black:DOAlpha(0, false)
        black:DOAlpha(0.5, duration, Ease.Linear, false)
    end

    --防止点击穿透
    local eventTrigger = dialog:GetComponent("EventTrigger")
    if not eventTrigger then
        dialog.gameObject:AddComponent(typeof(EventTrigger))
    end
end

return BaseUI
