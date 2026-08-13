
--! file: main.lua

function love.load()
    
    Domino = {}
    Domino.left_piece_value = 0 
    Domino.right_piece_value = 0



    local sheet = love.graphics.newImage("domino_sheet.png")
    local domW, domH = 50, 100
    local quads = {}

    for i = 0, 6 do
    quads[i+1] = love.graphics.newQuad(
        i * domW, 0,      -- x, y position in the sheet
        domW, domH,        -- width, height of this cell
        sheet:getDimensions()
    )
end


    Random_pip_left = love.math.random(0,6)
    Random_pip_right = love.math.random(0,6)




    

end

function love.draw()
    love.graphics.draw(sheet, quads[3], x, y)
end