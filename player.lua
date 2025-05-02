local Player = {}

function Player.new(x, y)
    return {
        x = x,
        y = y,
        width = 100,  -- Basket width
        height = 30,  -- Basket height
        speed = 400   -- Movement speed
    }
    
end

return Player