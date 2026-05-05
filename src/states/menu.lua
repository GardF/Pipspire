local Colors = require("src.core.colors")
local Game   = require("src.core.game")

local Menu = {}

function Menu:enter(sm)
    self.sm = sm
end

function Menu:draw()
    love.graphics.clear(Colors.night)
    local w, h = love.graphics.getDimensions()

    love.graphics.setColor(Colors.parchment)
    love.graphics.printf("PIPS", 0, h * 0.22, w, "center")
    love.graphics.setColor(Colors.gold)
    love.graphics.printf("Piptower", 0, h * 0.30, w, "center")

    love.graphics.setColor(Colors.smoke)
    love.graphics.printf("Mexican Train  ->  Tower Building  ->  Pip Toss  ->  Shop  ->  repeat",
                         0, h * 0.46, w, "center")

    love.graphics.setColor(Colors.bone)
    love.graphics.printf("[ENTER] start run", 0, h * 0.60, w, "center")
    love.graphics.printf("[ESC] quit",        0, h * 0.66, w, "center")
end

function Menu:keypressed(key)
    if key == "return" or key == "kpenter" then
        Game.newRun()
        Game.startRound()
        self.sm:switch("mt")
    end
end

return Menu
