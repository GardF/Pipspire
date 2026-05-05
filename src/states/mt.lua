-- State: Mexican Train (MT)
-- Sequence diagram steps 0-2: Place piece -> Opponent places piece -> Finish round.

local Colors = require("src.core.colors")
local MT     = require("src.modules.mt")

local State = {}

function State:enter(sm)
    self.sm = sm
    MT.init()
end

function State:update(dt)
    MT.update(dt)
end

function State:draw()
    love.graphics.clear(Colors.table_red)
    MT.draw()

    love.graphics.setColor(Colors.parchment)
    love.graphics.print("State: Mexican Train (MT)", 10, 10)
    love.graphics.print("[SPACE] -> Tower Building   [BACKSPACE] menu", 10, 30)
end

function State:keypressed(key)
    if key == "space"     then self.sm:switch("tb")   end
    if key == "backspace" then self.sm:switch("menu") end
end

function State:mousepressed(x, y, button)
    MT.mousepressed(x, y, button)
end

return State
