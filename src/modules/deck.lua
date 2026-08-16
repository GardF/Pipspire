--! file: deck.lua

local deck = {}

deck.pieces = {}  -- liste av piece-indekser (1-28) som fortsatt er tilgjengelige
deck.area = { x = 0, y = 0 }

function deck.init()
    deck.pieces = {}
    for i = 1, 28 do
        table.insert(deck.pieces, i)
    end
end

function deck.draw_random()
    if #deck.pieces == 0 then
        return nil  -- dekken er tom
    end

    local index = love.math.random(1, #deck.pieces)
    local piece = deck.pieces[index]
    table.remove(deck.pieces, index)
    return piece
end

function deck.position(domW, domH)
    local screenW = love.graphics.getWidth()
    local margin = 30

    deck.area.x = screenW - domW - margin
    deck.area.y = margin
end

function deck.draw(sheet, quads, font)
    -- 0-0 brikken er alltid indeks 1 (jf. build_domino_lookup rekkefølge)
    love.graphics.draw(sheet, quads[1], deck.area.x, deck.area.y)

    love.graphics.setFont(font)
    local text = tostring(#deck.pieces)
    local textW = font:getWidth(text)
    love.graphics.print(text, deck.area.x + (quads[1]:getViewport()) - textW - 5, deck.area.y + 5)
end

return deck