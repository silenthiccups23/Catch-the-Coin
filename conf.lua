function love.conf(t)
    -- Basic Settings
    t.identity = "jimmygreen"           -- Save directory name
    t.version = "11.4"                  -- Love2D version
    t.console = false                   -- Console window (Windows only)
    t.gammacorrect = false              -- Gamma correction

    -- Window Settings
    t.window.title = "My game "         -- Window title
    t.window.width = 1280               -- Window width
    t.window.height = 720               -- Window height
    t.window.resizable = true           -- Allow window resizing
    t.window.minwidth = 800             -- Minimum window width
    t.window.minheight = 600            -- Minimum window height
    t.window.vsync = 1                  -- Vertical sync (1 = enabled)
    t.window.msaa = 0                   -- Anti-aliasing (0 = disabled)
    t.window.highdpi = true             -- Support for Retina displays
    t.window.usedpiscale = true         -- Automatic DPI scaling

    -- Module Settings
    t.modules.physics = false           -- Disable physics if not needed
    t.modules.joystick = false          -- Disable joystick if not needed
    t.modules.touch = false             -- Disable touch if not needed
    t.modules.video = false             -- Disable video if not needed
end