local domino = {}

domino.lookup = {}       -- "low-high" -> indeks (1-28)
domino.pips = {}         -- indeks -> {low, high}
domino.quads = {}        -- indeks -> quad
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
    for i = 0, 27 do
        domino.quads[i + 1] = love.graphics.newQuad(i * domino.W, 0, domino.W, domino.H, sheetW, sheetH)
    end
end

function domino.get(low, high)
    local lo, hi = math.min(low, high), math.max(low, high)
    return domino.lookup[lo .. "-" .. hi]
end

function domino.matches(index_a, index_b)
    local a, b = domino.pips[index_a], domino.pips[index_b]
    return a[1] == b[1] or a[1] == b[2] or a[2] == b[1] or a[2] == b[2]
end

return domino