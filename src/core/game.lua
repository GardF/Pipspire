-- Shared run state across MT, TB, PR, Shop.
-- One run = many rounds, each round goes MT -> TB -> PR -> Shop (or gameover).

local Game = {}

function Game.newRun()
    Game.round         = 1
    Game.height        = 0
    Game.pipsRemaining = 0
    Game.money         = 0
    Game.towerFell     = false
    Game.inventory     = {}
end

function Game.startRound()
    -- Placeholder: number of pips you fail to place during MT.
    -- Real version will be set by MT module at end-of-round.
    Game.pipsRemaining = 4 + Game.round
end

function Game.endRound()
    Game.round = Game.round + 1
end

return Game
