--! file: main.lua

local input = require("src.input")
local hand = require("src.modules.hand")
local board = require("src.modules.board")
local fonts = require("src.fonts")
local train = require("src.modules.train")

local sheet
local quads = {}
local domino_lookup = {}
local domW, domH = 50, 100

local function build_domino_lookup()
    local index = 1
    for n = 0, 6 do
        domino_lookup[n .. "-" .. n] = index
        index = index + 1
    end
    for high = 6, 1, -1 do
        for low = high - 1, 0, -1 do
            domino_lookup[low .. "-" .. high] = index
            index = index + 1
        end
    end
end

local function build_quads()
    local sheetW, sheetH = sheet:getDimensions()
    for i = 0, 27 do
        quads[i + 1] = love.graphics.newQuad(i * domW, 0, domW, domH, sheetW, sheetH)
    end
end

local function pick_random_domino()
    local rpt = love.math.random(0, 6)
    local rpb = love.math.random(0, 6)
    local low, high = math.min(rpt, rpb), math.max(rpt, rpb)
    return domino_lookup[low .. "-" .. high]
end

function love.mousepressed(x, y, button)
    input.mousepressed(x, y, button, hand.pieces)
end

function love.mousemoved(x, y, dx, dy)
    input.mousemoved(x, y, dx, dy)
end

function love.mousereleased(x, y, button)
    input.mousereleased(x, y, button)
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    sheet = love.graphics.newImage("assets/domino_sheet.png")

    fonts.load()
    love.graphics.setFont(fonts.medium)

    build_domino_lookup()
    build_quads()

    hand.centerOnScreen()
    train.center()

    for i = 1, hand.max_size do
        hand.addPiece(pick_random_domino(), domW, domH)
    end

    train.addPiece(pick_random_domino(), domW, domH)
    
end

function love.draw()
    board.draw()
    train.draw()
    hand.draw()
 
    for _, d in ipairs(train.pieces) do
        love.graphics.draw(sheet, quads[d.piece], d.x, d.y)
    end   

    for _, d in ipairs(hand.pieces) do
        love.graphics.draw(sheet, quads[d.piece], d.x, d.y)
    end

    

    love.graphics.print("Pips", 100, 100)
end
