-- Phase 3 of the round: Pip Toss (Piprush).
-- Unplaced pips get thrown at the tower. Each one increases the chance it falls.
-- Camera is zoomed OUT to show the full tower.
-- This is the emotional peak of the round.

local Colors = require("src.core.colors")
local Camera = require("src.core.camera")
local Game   = require("src.core.game")
local PR     = require("src.modules.pr")

local State = {}

function State:enter(sm)
    self.sm     = sm
    self.camera = Camera.new()
    self.camera:setZoom(0.4, true)
    PR.init()
    PR.pipsRemaining = Game.pipsRemaining
    self.resolved = false
    self.outcome  = nil
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
    love.graphics.print(string.format("Round %d  -  Phase 3: PIP TOSS (zoomed OUT)", Game.round), 10, 10)
    love.graphics.print(string.format("Tower height: %d   Pips incoming: %d", Game.height, Game.pipsRemaining), 10, 30)

    if not self.resolved then
        love.graphics.print("[SPACE] resolve toss", 10, 50)
    else
        love.graphics.setColor(Colors.parchment)
        love.graphics.print(self.outcome, 10, 50)
        love.graphics.print("[SPACE] continue", 10, 70)
    end
end

function State:keypressed(key)
    if key ~= "space" then return end

    if not self.resolved then
        -- Placeholder odds: more pips + taller tower = more risk.
        local chance = math.min(0.85, (Game.pipsRemaining * Game.height) / 80)
        if math.random() < chance then
            Game.towerFell = true
            self.outcome = "The tower fell."
        else
            Game.towerFell = false
            self.outcome = "It stands. Mefistofeles waits."
        end
        self.resolved = true
    else
        if Game.towerFell then
            self.sm:switch("gameover")
        else
            self.sm:switch("shop")
        end
    end
end

return State
