-- PEAR36 palette by Kerrie Lake
-- https://lospec.com/palette-list/pear36
--
-- TODO: Fill in all 36 hex values from lospec. Below is a starter
-- subset chosen for the Faust/Mefistofeles tone (red table, gold,
-- parchment, smoke, deep night).

local function hex(h)
    h = h:gsub("#", "")
    return {
        tonumber(h:sub(1, 2), 16) / 255,
        tonumber(h:sub(3, 4), 16) / 255,
        tonumber(h:sub(5, 6), 16) / 255,
    }
end

local Colors = {
    -- Backgrounds
    night       = hex("#080615"),
    table_red   = hex("#9e1c1c"),  -- casino-rød bordduk
    smoke       = hex("#615650"),

    -- Foregrounds
    parchment   = hex("#f7e2bb"),
    gold        = hex("#e8a42b"),
    bone        = hex("#d9c8a8"),
    ember       = hex("#d9531e"),

    -- Accents
    sulphur     = hex("#f2c849"),
    ink         = hex("#1a1424"),
}

Colors.hex = hex
return Colors
