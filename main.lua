if arg[2] == "debug" then
    require("lldebugger").start()
end


function love.load()
listOfRectangles = {} 
end

function createRect()
    rect = {}
    rect.x = 100
    rect.y = 100
    rect.width = 100
    rect.height = 70
    rect.speed = 100
    table.insert(listOfRectangles,rect)
end
   

function love.update(dt)
    rect.x = rect.x + rect.speed * dt
end

function love.draw()
    love.graphics.rectangle("fill",rect.x, rect.y, rect.width, rect.height)
end











local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end