local Colors = require("src.core.colors")

local Menu = {}

function Menu:enter(sm)
    self.sm = sm
end

function Menu:draw()
    love.graphics.clear(Colors.night)
    local w, h = love.graphics.getDimensions()

    love.graphics.setColor(Colors.parchment)
    love.graphics.printf("PIPS", 0, h * 0.25, w, "center")
    love.graphics.setColor(Colors.gold)
    love.graphics.printf("Piptower", 0, h * 0.32, w, "center")

    love.graphics.setColor(Colors.bone)
    love.graphics.printf("[1] Mexican Train   [2] Tower Building   [3] Piprush",
                         0, h * 0.55, w, "center")
    love.graphics.printf("[ESC] quit", 0, h * 0.65, w, "center")
end

function Menu:keypressed(key)
    if key == "1" then self.sm:switch("mt") end
    if key == "2" then self.sm:switch("tb") end
    if key == "3" then self.sm:switch("pr") end
end

return Menu
