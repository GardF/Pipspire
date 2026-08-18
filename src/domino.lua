local domino = {}

domino.lookup = {}
domino.pips = {}
domino.quads = {}
domino.half_quads = {}   -- indeks -> { low = quad, high = quad }
domino.W, domino.H = 50, 100

function domino.build_lookup()
    local index = 1
    for n = 0, 6 do
        domino.lookup[n .. "-" .. n] = index
        domino.pips[index] = { n, n }
        index = index + 1
    end
    for high = 6, 1, -1 do
        for low = high - 1, 0, -1 do
            domino.lookup[low .. "-" .. high] = index
            domino.pips[index] = { low, high }
            index = index + 1
        end
    end
end

function domino.build_quads(sheet)
    local sheetW, sheetH = sheet:getDimensions()
    local halfH = domino.H / 2

    for i = 0, 27 do
        local idx = i + 1
        domino.quads[idx] = love.graphics.newQuad(i * domino.W, 0, domino.W, domino.H, sheetW, sheetH)

        -- Antakelse: øverste halvdel = low, nederste halvdel = high. Bytt om hvis dette er feil.
        domino.half_quads[idx] = {
            low  = love.graphics.newQuad(i * domino.W, 0, domino.W, halfH, sheetW, sheetH),
            high = love.graphics.newQuad(i * domino.W, halfH, domino.W, halfH, sheetW, sheetH),
        }
    end
end

function domino.get(low, high)
    local lo, hi = math.min(low, high), math.max(low, high)
    return domino.lookup[lo .. "-" .. hi]
end

function domino.matchesValue(piece_index, value)
    local p = domino.pips[piece_index]
    return p[1] == value or p[2] == value
end

-- Returnerer quaden for halvdelen av piece_index som viser 'value'
function domino.getHalfQuad(piece_index, value)
    local p = domino.pips[piece_index]
    if value == p[1] then
        return domino.half_quads[piece_index].high
    else
        return domino.half_quads[piece_index].low
    end
end


function domino.getHalfInfo(piece_index, value)
    local p = domino.pips[piece_index]
    if value == p[1] then
        return domino.half_quads[piece_index].low, math.rad(90)
    else
        return domino.half_quads[piece_index].high, math.rad(-90)
    end
end

return domino