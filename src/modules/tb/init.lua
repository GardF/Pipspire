-- Tower Building (TB) module
-- Spire-bygging fra zoomet inn-perspektiv. Stabilitet, vekt, balanse.
-- Design notes: see "piptower TB - Functions" and "Tower Building (TB)".

local TB = {}

function TB.init()
    TB.tower = {}        -- list of placed pieces with position/rotation
    TB.height = 0
end

function TB.update(dt)
    -- TODO: physics-light stability checks
end

function TB.draw()
    -- TODO: render tower from current camera
    love.graphics.setColor(0.97, 0.89, 0.73, 0.4)
    love.graphics.rectangle("line", -100, -200, 200, 400)
end

return TB
