-- State: Tower Building (TB)
-- Sequence diagram step 3: Add last piece to spire.
-- Camera is ZOOMED IN here.

local Colors = require("src.core.colors")
local Camera = require("src.core.camera")
local TB     = require("src.modules.tb")

local State = {}

function State:enter(sm)
    self.sm     = sm
    self.camera = Camera.new()
    self.camera:setZoom(2.0, true) -- zoomed in
    TB.init()
end

function State:update(dt)
    self.camera:update(dt)
    TB.update(dt)
end

function State:draw()
    love.graphics.clear(Colors.ink)

    self.camera:attach()
    TB.draw()
    self.camera:detach()

    love.graphics.setColor(Colors.parchment)
    love.graphics.print("State: Tower Building (TB) - zoomed IN", 10, 10)
    love.graphics.print("[SPACE] -> Piprush   [BACKSPACE] menu", 10, 30)
end

function State:keypressed(key)
    if key == "space"     then self.sm:switch("pr")   end
    if key == "backspace" then self.sm:switch("menu") end
end

return State
