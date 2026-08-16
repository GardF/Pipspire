--! file: hand.lua

local hand = {}

hand.max_size = 5
hand.slots = {}  -- indeks 1-5, hver enten et domino-objekt eller nil

hand.area = { x = 50, y = 500, w = 400, h = 120 }

function hand.centerOnScreen()
    local screenW, screenH = love.graphics.getDimensions()
    local bottom_margin = 40

    hand.area.x = (screenW - hand.area.w) / 2
    hand.area.y = screenH - hand.area.h - bottom_margin
end

function hand.getSlotPosition(slot, domW, domH)
    local spacing = 10
    local x = hand.area.x + spacing + (slot - 1) * (domW + spacing)
    local y = hand.area.y + (hand.area.h - domH) / 2
    return x, y
end

-- Finner første ledige slot, eller nil hvis hånden er full
local function find_empty_slot()
    for i = 1, hand.max_size do
        if hand.slots[i] == nil then
            return i
        end
    end
    return nil
end

function hand.addPiece(piece_index, domW, domH)
    local slot = find_empty_slot()
    if not slot then
        return false  -- hånden er full
    end

    local x, y = hand.getSlotPosition(slot, domW, domH)

    hand.slots[slot] = {
        x = x, y = y, piece = piece_index, w = domW, h = domH, slot = slot
    }
    return true
end

function hand.removePiece(piece_obj)
    if piece_obj.slot and hand.slots[piece_obj.slot] == piece_obj then
        hand.slots[piece_obj.slot] = nil
    end
end

-- Returnerer en tett liste over brikker som faktisk finnes, til bruk i input.lua osv.
function hand.getPieceList()
    local list = {}
    for i = 1, hand.max_size do
        if hand.slots[i] then
            table.insert(list, hand.slots[i])
        end
    end
    return list
end

function hand.draw()
    love.graphics.setColor(0.216, 0.580, 0.431, 1)  -- #37946e
    love.graphics.rectangle("fill", hand.area.x, hand.area.y, hand.area.w, hand.area.h)
    love.graphics.setColor(1, 1, 1, 1)
end

return hand