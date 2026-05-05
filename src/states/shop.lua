-- State: Shop (Mefistofeles offers a deal)
-- Between rounds. Player picks up a new powerup.

local Colors = require("src.core.colors")

local State = {}

function State:enter(sm)
    self.sm = sm
end

function State:draw()
    love.graphics.clear(Colors.ink)
    local w, h = love.graphics.getDimensions()

    love.graphics.setColor(Colors.gold)
    love.graphics.printf("MEFISTOFELES' BARGAIN", 0, h * 0.2, w, "center")

    love.graphics.setColor(Colors.parchment)
    love.graphics.printf("Sign here. Just here.", 0, h * 0.3, w, "center")

    love.graphics.setColor(Colors.bone)
    love.graphics.printf("[ENTER] next round   [BACKSPACE] menu", 0, h * 0.7, w, "center")
end

function State:keypressed(key)
    if key == "return"    then self.sm:switch("mt") end
    if key == "backspace" then self.sm:switch("menu") end
end

return State
