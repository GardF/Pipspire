--! file: input.lua

local input = {}


local dragging_piece = nil
local drag_offset_x, drag_offset_y = 0, 0

function input.mousepressed(x, y, button, dominoes)
    if button ~= 1 then return end

    -- gå gjennom listen bakfra, så brikken øverst (sist tegnet) prioriteres
    for i = #dominoes, 1, -1 do
        local d = dominoes[i]
        if x >= d.x and x <= d.x + d.w
           and y >= d.y and y <= d.y + d.h then
            dragging_piece = d
            drag_offset_x = x - d.x
            drag_offset_y = y - d.y
            return
        end
    end
end

function input.mousemoved(x, y, dx, dy)
    if dragging_piece then
        dragging_piece.x = x - drag_offset_x
        dragging_piece.y = y - drag_offset_y
    end
end

function input.mousereleased(x, y, button)
    if button == 1 then
        local piece = dragging_piece
        dragging_piece = nil
        return piece  -- send tilbake HVILKEN brikke som ble sluppet
    end
end

return input