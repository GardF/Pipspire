-- Phase 4 of the round: Shop.
-- Mefistofeles offers a deal between rounds.

local Colors = require("src.core.colors")
local Game   = require("src.core.game")

local State = {}

function State:enter(sm)
    self.sm = sm
end

function State:draw()
    love.graphics.clear(Colors.ink)
    local w, h = love.graphics.getDimensions()

    love.graphics.setColor(Colors.gold)
    love.graphics.printf("MEFISTOFELES' BARGAIN", 0, h * 0.18, w, "center")

    love.graphics.setColor(Colors.parchment)
    love.graphics.printf(string.format("Round %d survived. Tower stands at %d.",
                                       Game.round, Game.height),
                         0, h * 0.30, w, "center")
    love.graphics.printf("Sign here. Just here.", 0, h * 0.38, w, "center")

    love.graphics.setColor(Colors.bone)
    love.graphics.printf("[ENTER] next round   [BACKSPACE] menu",
                         0, h * 0.65, w, "center")
end

function State:keypressed(key)
    if key == "return" or key == "kpenter" then
        Game.endRound()
        Game.startRound()
        self.sm:switch("mt")
    end
    if key == "backspace" then
        self.sm:switch("menu")
    end
end

return State
