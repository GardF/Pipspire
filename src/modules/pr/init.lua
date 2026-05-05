-- Piprush (PR) module
-- The Pip Toss. Remaining pips are thrown at the tower.
-- Each pip increases the chance the tower falls. Outcome is not certain.
-- Design notes: see "piptower PR - Functions" and "Piprush (PR)".

local PR = {}

function PR.init()
    PR.pipsRemaining = 0
    PR.tossing       = false
    PR.fallChance    = 0   -- 0..1
end

function PR.update(dt)
    -- TODO: animate toss, accumulate fall chance
end

function PR.draw()
    -- TODO: render full tower + incoming pips
    love.graphics.setColor(0.91, 0.64, 0.17, 0.5)
    love.graphics.rectangle("line", -150, -800, 300, 1600)
end

return PR
