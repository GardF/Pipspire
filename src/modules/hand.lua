--! file: hand.lua

local hand = {}

hand.max_size = 5
hand.pieces = {}  -- liste av domino-objekter (samme struktur som dominoes)

-- Området brikkene skal ligge innenfor
hand.area = { x = 50, y = 500, w = 400, h = 120 }

function hand.addPiece(piece_index, domW, domH)
    if #hand.pieces >= hand.max_size then
        return false  
    end

    local slot = #hand.pieces + 1
    local spacing = 10
    local x = hand.area.x + spacing + (slot - 1) * (domW + spacing)
    local y = hand.area.y + (hand.area.h - domH) / 2  -- sentrert vertikalt

    table.insert(hand.pieces, {
        x = x, y = y, piece = piece_index, w = domW, h = domH
    })
    return true
end


function hand.centerOnScreen()
   local screenW, screenH = love.graphics.getDimensions()
   local bottom_margin = 0

    hand.area.x = (screenW - hand.area.w) / 2
    hand.area.y = screenH - hand.area.h - bottom_margin
end

function hand.draw()
    love.graphics.setColor(0.235, 0.639, 0.439, 1)  -- #3ca370
    love.graphics.rectangle("fill", hand.area.x, hand.area.y, hand.area.w, hand.area.h)
    love.graphics.setColor(1, 1, 1, 1) 
end

return hand