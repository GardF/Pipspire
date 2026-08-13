--! file: main.lua

local sheet
local quads = {}
local domino_lookup = {}
local domino_piece

local domW, domH = 50, 100

-- Build lookup: "low-high" -> piece index (1 to 28)
local function build_domino_lookup()
    local index = 1
    for high = 0, 6 do
        for low = 0, high do
            local key = low .. "-" .. high
            domino_lookup[key] = index
            index = index + 1
        end
    end
end

-- Build one quad per piece in the sheet (28 total, matching lookup order)
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

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")

    sheet = love.graphics.newImage("assets/domino_sheet.png")
    build_domino_lookup()
    build_quads()

    domino_piece = pick_random_domino()
end

function love.draw()
    love.graphics.draw(sheet, quads[domino_piece], 100, 100)
end