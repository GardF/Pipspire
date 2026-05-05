-- Pips / Piptower
-- Entry point. See CLAUDE.md for project context.

local StateMachine = require("src.core.statemachine")

local states = {
    menu     = require("src.states.menu"),
    mt       = require("src.states.mt"),
    tb       = require("src.states.tb"),
    pr       = require("src.states.pr"),
    shop     = require("src.states.shop"),
    gameover = require("src.states.gameover"),
}

local sm

function love.load()
    -- Pixel art friendly: nearest-neighbour scaling everywhere
    love.graphics.setDefaultFilter("nearest", "nearest")
    math.randomseed(os.time())

    sm = StateMachine.new(states)
    sm:switch("menu")
end

function love.update(dt)
    sm:update(dt)
end

function love.draw()
    sm:draw()
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
    sm:keypressed(key)
end

function love.mousepressed(x, y, button)
    sm:mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
    sm:mousereleased(x, y, button)
end

function love.resize(w, h)
    if sm.current and sm.current.resize then
        sm.current:resize(w, h)
    end
end
