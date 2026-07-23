

function love.load()
    
    Domino = {}
    Domino.left = 0
    Domino.right = 0

    Random_pip_left = love.math.random(0,6)
    Random_pip_right = love.math.random(0,6)
    

    Domino.left = Random_pip_left
    Domino.right = Random_pip_right

end

function love.draw()
    love.graphics.print("Train", 400, 100)

    love.graphics.print(Domino.left, 200, 300)
    love.graphics.print(Domino.right, 400, 300)

end