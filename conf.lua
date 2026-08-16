--! file: conf.lua

function love.conf(t)
    t.window.title = "Pips"
    t.window.fullscreen = true
    t.window.fullscreentype = "desktop"
    t.window.resizable = true

    -- Fallback-størrelse hvis fullscreen av en eller annen grunn ikke slår inn
    t.window.width = 1280
    t.window.height = 720

    t.identity = "pips"  -- mappenavn for lagrede filer (save data), under LÖVE sin appdata-mappe

    t.console = true  -- åpner en konsoll-terminal ved siden av spillet på Windows, nyttig for print()-debugging
end