local fonts = {}

local ARIAL_PATH = "fonts/arial/ARIAL.TTF"

function fonts.load()
    fonts.small  = love.graphics.newFont(ARIAL_PATH, 14)
    fonts.medium = love.graphics.newFont(ARIAL_PATH, 24)
    fonts.large  = love.graphics.newFont(ARIAL_PATH, 48)
end

return fonts