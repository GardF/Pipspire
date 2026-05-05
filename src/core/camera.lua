-- Camera with smooth zoom.
-- Critical for the design: TB (Tower Building) is zoomed IN,
-- PR (Piprush) is zoomed OUT to show the whole tower.

local Camera = {}
Camera.__index = Camera

function Camera.new()
    local self = setmetatable({}, Camera)
    self.x, self.y         = 0, 0
    self.scale             = 1
    self.targetScale       = 1
    self.targetX, self.targetY = 0, 0
    self.lerpSpeed         = 4
    return self
end

function Camera:setZoom(scale, instant)
    self.targetScale = scale
    if instant then self.scale = scale end
end

function Camera:moveTo(x, y, instant)
    self.targetX, self.targetY = x, y
    if instant then self.x, self.y = x, y end
end

function Camera:update(dt)
    local t = math.min(1, dt * self.lerpSpeed)
    self.scale = self.scale + (self.targetScale - self.scale) * t
    self.x     = self.x     + (self.targetX     - self.x)     * t
    self.y     = self.y     + (self.targetY     - self.y)     * t
end

function Camera:attach()
    love.graphics.push()
    local sw, sh = love.graphics.getDimensions()
    love.graphics.translate(sw / 2, sh / 2)
    love.graphics.scale(self.scale)
    love.graphics.translate(-self.x, -self.y)
end

function Camera:detach()
    love.graphics.pop()
end

return Camera
