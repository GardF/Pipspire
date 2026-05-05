local Colors = require("src.core.colors")

local State = {}

function State:enter(sm)
    self.sm = sm
end

function State:draw()
    love.graphics.clear(Colors.night)
    local w, h = love.graphics.getDimensions()

    love.graphics.setColor(Colors.ember)
    love.graphics.printf("THE TOWER FELL", 0, h * 0.4, w, "center")

    love.graphics.setColor(Colors.bone)
    love.graphics.printf("[ENTER] try again   [BACKSPACE] menu", 0, h * 0.6, w, "center")
end

function State:keypressed(key)
    if key == "return"    then self.sm:switch("mt") end
    if key == "backspace" then self.sm:switch("menu") end
end

return State
