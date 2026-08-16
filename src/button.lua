local Button = {}
Button.__index = Button

function Button.new(x, y, w, h, text)
    local self = setmetatable({}, Button)
    self.x, self.y, self.w, self.h = x, y, w, h
    self.text = text
    return self
end

function Button:contains(px, py)
    return px >= self.x and px <= self.x + self.w
       and py >= self.y and py <= self.y + self.h
end

function Button:draw(font)
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("line", self.x, self.y, self.w, self.h)

    love.graphics.setFont(font)
    love.graphics.setColor(1, 1, 1, 1)
    local textW = font:getWidth(self.text)
    local textH = font:getHeight()
    love.graphics.print(self.text, self.x + (self.w - textW) / 2, self.y + (self.h - textH) / 2)
end

return Button