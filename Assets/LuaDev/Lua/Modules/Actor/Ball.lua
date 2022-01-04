local LuaBehaviour = require "Core.LuaBehaviour"
local Ball = Class("Ball", LuaBehaviour)

function Ball:PrefabPath()
    return "Prefabs/Actors/Ball"
end

function Ball:Awake()
    self.super.Awake(self)
end

return Ball
