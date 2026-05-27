-- Mexican Train (MT) module
-- Domino set, placement rules, train logic.
-- Design notes: see "piptower_MT - Functions" and "Mexican Train (MT)".

local MT = {}

function MT.init()
    MT.dominoes = {}     -- the player's hand
    MT.set      = {}     -- the shared set (boneyard / table)
    MT.trains   = {}     -- player + opponent trains
end

function MT.update(dt)
    -- TODO: turn logic, opponent AI
end

function MT.draw()
    -- TODO: render dominoes, trains, hand
end

function MT.mousepressed(x, y, button)
    -- TODO: select / place domino
end

return MT
