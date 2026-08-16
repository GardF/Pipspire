local train = {}

train.pieces = {}
train.area = { x = 0, y = 0, w = 70, h = 120 }

function train.center()
    local screenW, screenH = love.graphics.getDimensions()
    local offset_from_bottom = 200  -- fast avstand fra bunnen av skjermen

    train.area.x = (screenW - train.area.w) / 2
    train.area.y = screenH - offset_from_bottom - train.area.h
end

function train.addPiece(piece_index, domW, domH)
    local x = train.area.x + (train.area.w - domW) / 2
    local y = train.area.y + (train.area.h - domH) / 2

    table.insert(train.pieces, {
        x = x, y = y, piece = piece_index, w = domW, h = domH
    })
end

function train.draw()
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("fill", train.area.x, train.area.y, train.area.w, train.area.h)
    love.graphics.setColor(1, 1, 1, 1)
end

return train