BTween = {}

--开始模拟抛物线动画（height:距离初始点的高度  duration：0-1的分段数）-----------------------------------------------------------------------------
function BTween.StartParabola(delay, trans, toPos, height, delta, elasticity, onCollision, onStop, worldSpace)
    ToLuaGameFramework.BTween.StartParabola(delay, trans, toPos, height, delta, worldSpace, elasticity, nil, onCollision, nil, onStop)
end

--终止抛物线动画
function BTween.StopParabola(trans)
    ToLuaGameFramework.BTween.StopParabola(trans)
end

--开始对单个数值进行Tween运算(onUpdate:返回实时数值 onFinish：不返回值)------------------------------------------------------------------------------
function BTween.Value(delay, startValue, toValue, duration, easeType, onUpdate, onFinish)
    ToLuaGameFramework.BTween.Value(delay, startValue, toValue, duration, easeType, onUpdate, onFinish)
end
