-- Phase 1 of the round: Mexican Train.
-- Player and opponent place dominoes. Pips that don't make it onto a train
-- get carried over to the Pip Toss in the same round.

local Colors = require("src.core.colors")
local Game   = require("src.core.game")
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
    love.graphics.print(string.format("Round %d  -  Phase 1: Mexican Train", Game.round), 10, 10)
    love.graphics.print(string.format("Unplaced pips so far: %d", Game.pipsRemaining), 10, 30)
    love.graphics.print("[SPACE] finish round  ->  Tower Building", 10, 50)
    love.graphics.print("[BACKSPACE] abandon run", 10, 70)
end

function State:keypressed(key)
    if key == "space"     then self.sm:switch("tb")   end
    if key == "backspace" then self.sm:switch("menu") end
end

function State:mousepressed(x, y, button)
    MT.mousepressed(x, y, button)
end

return State
