-- Phase 2 of the round: Tower Building.
-- Add the round's piece(s) to the spire. Camera is zoomed IN.

local Colors = require("src.core.colors")
local Camera = require("src.core.camera")
local Game   = require("src.core.game")
local TB     = require("src.modules.tb")

local State = {}

function State:enter(sm)
    self.sm     = sm
    self.camera = Camera.new()
    self.camera:setZoom(2.0, true)
    TB.init()

    -- Placeholder: each round adds one piece to the tower.
    Game.height = Game.height + 1
end

function State:update(dt)
    self.camera:update(dt)
    TB.update(dt)
end

function State:draw()
    love.graphics.clear(Colors.ink)

    self.camera:attach()
    TB.draw()
    self.camera:detach()

    love.graphics.setColor(Colors.parchment)
    love.graphics.print(string.format("Round %d  -  Phase 2: Tower Building (zoomed IN)", Game.round), 10, 10)
    love.graphics.print(string.format("Tower height: %d   Pips to toss: %d", Game.height, Game.pipsRemaining), 10, 30)
    love.graphics.print("[SPACE] continue  ->  Pip Toss", 10, 50)
end

function State:keypressed(key)
    if key == "space" then self.sm:switch("pr") end
end

return State
