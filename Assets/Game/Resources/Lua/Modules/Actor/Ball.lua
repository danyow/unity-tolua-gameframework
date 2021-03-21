local LuaBehaviour = require "Core.LuaBehaviour"
local Ball = class("Ball", LuaBehaviour)

function Ball:prefabPath()
    return "Prefabs/Actors/Ball"
end

function Ball:onAwake()
    self.super.onAwake(self)
end

return Ball
