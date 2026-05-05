-- State: Piprush (PR)
-- Sequence diagram step 4: Pip Toss.
-- Camera is ZOOMED OUT - whole tower visible. The emotional peak of the round.

local Colors = require("src.core.colors")
local Camera = require("src.core.camera")
local PR     = require("src.modules.pr")

local State = {}

function State:enter(sm)
    self.sm     = sm
    self.camera = Camera.new()
    self.camera:setZoom(0.4, true) -- zoomed out
    PR.init()
end

function State:update(dt)
    self.camera:update(dt)
    PR.update(dt)
end

function State:draw()
    love.graphics.clear(Colors.night)

    self.camera:attach()
    PR.draw()
    self.camera:detach()

    love.graphics.setColor(Colors.gold)
    love.graphics.print("State: Piprush (PR) - zoomed OUT - PIP TOSS!", 10, 10)
    love.graphics.print("[SPACE] -> Shop   [BACKSPACE] menu", 10, 30)
end

function State:keypressed(key)
    if key == "space"     then self.sm:switch("shop") end
    if key == "backspace" then self.sm:switch("menu") end
end

return State
