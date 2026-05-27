function love.conf(t)
    t.identity        = "pips"
    t.version         = "11.5"
    t.console         = false

    t.window.title    = "Pips - Piptower"
    t.window.icon     = nil
    t.window.width    = 1280
    t.window.height   = 720
    t.window.minwidth = 320
    t.window.minheight = 180
    t.window.resizable = true
    t.window.vsync    = 1

    -- Disable unused modules to start fast (re-enable as needed)
    t.modules.video   = false
    t.modules.physics = false
end
