local domino = require("src.domino")

local train = {}

train.pieces = {}       -- historikk: liste av piece-indekser lagt i toget
train.open_value = nil  -- pip-tallet som er tilgjengelig for matching akkurat nå
train.image = nil
train.area = { x = 0, y = 0, w = 0, h = 0 }

function train.load()
    train.image = love.graphics.newImage("assets/train.png")
end

function train.center()
    local screenW, screenH = love.graphics.getDimensions()
    local offset_from_bottom = 200
    local imgW, imgH = train.image:getDimensions()

    -- Området dekker bildet OG plassen brikke-halvdelen stikker ut i til høyre
    train.area.w = imgW + domino.W
    train.area.h = imgH
    train.area.x = (screenW - imgW) / 2
    train.area.y = screenH - offset_from_bottom - train.area.h
end

-- Legger til en brikke. Returnerer false hvis den ikke matcher åpen side (når train ikke er tom).
function train.addPiece(piece_index)
    local pips = domino.pips[piece_index]
    local low, high = pips[1], pips[2]

    if train.open_value == nil then
        -- Første brikke: velg tilfeldig hvilken side som er åpen
        train.open_value = (love.math.random(0, 1) == 0) and low or high
    else
        if not domino.matchesValue(piece_index, train.open_value) then
            return false
        end
        -- Siden som IKKE matchet blir ny åpen side
        if low == train.open_value then
            train.open_value = high
        else
            train.open_value = low
        end
    end

    table.insert(train.pieces, piece_index)
    return true
end

function train.draw(sheet)
    love.graphics.draw(train.image, train.area.x, train.area.y)

    if #train.pieces > 0 then
        local front_piece = train.pieces[#train.pieces]
        local quad, rotation = domino.getHalfInfo(front_piece, train.open_value)
        local half_size = domino.W  -- 50x50, kvadratisk halvdel

        local piece_x = train.area.x + train.image:getWidth()
        local piece_y = train.area.y + (train.area.h - half_size) / 2

        love.graphics.draw(
            sheet, quad,
            piece_x + half_size / 2, piece_y + half_size / 2,
            rotation,
            1, 1,
            half_size / 2, half_size / 2
        )
    end
end

return train