local Colors = require("src.core.colors")
local Game   = require("src.core.game")

local State = {}

function State:enter(sm)
    self.sm = sm
end

function State:draw()
    love.graphics.clear(Colors.night)
    local w, h = love.graphics.getDimensions()

    love.graphics.setColor(Colors.ember)
    love.graphics.printf("THE TOWER FELL", 0, h * 0.32, w, "center")

    love.graphics.setColor(Colors.parchment)
    love.graphics.printf(string.format("Final height: %d   Round reached: %d",
                                       Game.height, Game.round),
                         0, h * 0.44, w, "center")

    love.graphics.setColor(Colors.bone)
    love.graphics.printf("[ENTER] back to menu", 0, h * 0.60, w, "center")
end

function State:keypressed(key)
    if key == "return" or key == "kpenter" then
        self.sm:switch("menu")
    end
end

return State
