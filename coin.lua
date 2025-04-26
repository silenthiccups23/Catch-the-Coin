local Coin = {}

function Coin.new(x, y)
    return {
        x = x,
        y = y,
        diameter = 16,
        value = 1,
        speed = 100
    }
end

function love.update(dt)
    coin.y = coin.y + coin.speed * dt --coing moving down
    if (coin.y > love.graphics.getHeight() + coin.diameter) then 
        coin.y = -coin.y
    end
end







return Coin