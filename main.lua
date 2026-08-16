--! file: main.lua

local input = require("src.input")
local hand = require("src.modules.hand")
local board = require("src.modules.board")
local fonts = require("src.fonts")
local train = require("src.modules.train")
local deck = require("src.modules.deck")
local domino = require("src.domino")
local collision = require("src.collision")

local sheet

function love.mousepressed(x, y, button)
    input.mousepressed(x, y, button, hand.pieces)
end

function love.mousemoved(x, y, dx, dy)
    input.mousemoved(x, y, dx, dy)
end

function love.mousereleased(x, y, button)
    local released_piece = input.mousereleased(x, y, button)
    if not released_piece then return end

    local over_train = collision.rects_overlap(
        released_piece.x, released_piece.y, released_piece.w, released_piece.h,
        train.area.x, train.area.y, train.area.w, train.area.h
    )

    if over_train and #train.pieces > 0 then
        local front_piece = train.pieces[#train.pieces]

        if domino.matches(released_piece.piece, front_piece.piece) then
            for i, p in ipairs(hand.pieces) do
                if p == released_piece then
                    table.remove(hand.pieces, i)
                    break
                end
            end
            train.addPiece(released_piece.piece, released_piece.w, released_piece.h)
        end
    end
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    sheet = love.graphics.newImage("assets/domino_sheet.png")

    domino.build_lookup()
    domino.build_quads(sheet)
    fonts.load()

    deck.init()
    deck.position(domino.W, domino.H)

    hand.centerOnScreen()
    train.center()

    for i = 1, hand.max_size do
        hand.addPiece(deck.draw_random(), domino.W, domino.H)
    end

    train.addPiece(deck.draw_random(), domino.W, domino.H)
    
end

function love.draw()
    board.draw()
    train.draw()
    hand.draw()
    deck.draw(sheet, domino.quads, fonts.small)
    
    for _, d in ipairs(train.pieces) do
        love.graphics.draw(sheet, domino.quads[d.piece], d.x, d.y)
    end
    
    for _, d in ipairs(hand.pieces) do
        love.graphics.draw(sheet, domino.quads[d.piece], d.x, d.y)
    end
end
