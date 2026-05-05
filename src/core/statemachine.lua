-- Simple state machine. Drives the flow described in
-- "Pips - Sequence Diagram.excalidraw":
--   menu -> mt -> tb -> pr -> shop -> mt (next round) -> ... -> gameover

local StateMachine = {}
StateMachine.__index = StateMachine

function StateMachine.new(states)
    local self = setmetatable({}, StateMachine)
    self.states      = states
    self.current     = nil
    self.currentName = nil
    return self
end

function StateMachine:switch(name, ...)
    assert(self.states[name], "Unknown state: " .. tostring(name))

    if self.current and self.current.exit then
        self.current:exit()
    end

    self.currentName = name
    self.current     = self.states[name]

    if self.current.enter then
        self.current:enter(self, ...)
    end
end

local function forward(method)
    return function(self, ...)
        if self.current and self.current[method] then
            self.current[method](self.current, ...)
        end
    end
end

StateMachine.update         = forward("update")
StateMachine.draw           = forward("draw")
StateMachine.keypressed     = forward("keypressed")
StateMachine.mousepressed   = forward("mousepressed")
StateMachine.mousereleased  = forward("mousereleased")

return StateMachine
