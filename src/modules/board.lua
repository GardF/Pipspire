local board = {}

function board.draw()
    local w, h = love.graphics.getDimensions()
     love.graphics.setColor(0.690, 0.188, 0.361, 1) 
    love.graphics.rectangle("fill", 0, 0, w, h)
    love.graphics.setColor(1, 1, 1, 1)
end

return board