local Player = require("player")
local Coin = require("coin")


local player
local coins = {}
local score = 0
local coinTimer = 0
local coinSpawnTime = 1  -- Spawn a coin every second


function love.load()
    player = Player.new(1280/2 - 50, 650)  -- Create basket at bottom of screen
    x = math.random(1280 - 16)
    table.insert(coins, Coin.new(x, -50))
end

function love.update(dt)
    --basquet movement 
    if love.keyboard.isDown("left") then --basquet moving left
        player.x = player.x - player.speed * dt
    elseif love.keyboard.isDown("right") then --basquet moving right
        player.x = player.x + player.speed * dt
    end
    --Coin movements
    for i, coin in ipairs(coins) do
        coin.y = coin.y + coin.speed * dt
    end
    
    --Check collision (backward loop)
    for i = #coins, 1, -1 do 
        local coin = coins[i]
        -- Clamp to find closest point 
        local closestX = math.max(player.x, math.min(player.x + player.width, coin.x))
        local closestY = math.max(player.y, math.min(player.y + player.height, coin.y))
        
        --calculate distance 
        local dx = closestX - coin.x 
        local dy = closestY - coin.y
        local distance = math.sqrt(dx * dx + dy * dy) 
        
        --check collision
        if distance <= coin.radius then 
            score = score + 1 
            table.remove(coins, i)
        end
    end

    --spawning after one second 
    coinTimer = coinTimer + dt --adds 1 second every 60 frames at 60 FPS
    if coinTimer >= 1 then 
        local new_x = math.random(1280 - 16)
        print("spawning coing at x:", new_x)
        table.insert(coins, Coin.new(new_x, -50))
        coinTimer = 0 -- reset the cointimer
    end
end

function love.draw()
    love.graphics.setColor(0,0,1)
    love.graphics.rectangle("fill",player.x, player.y, player.width, player.height) --Player blue color 

    love.graphics.setColor(1,1,1) -- white color
    love.graphics.print("Score: " .. score, 10,10)

    love.graphics.setColor(1,0,0)
    for i, coin in ipairs(coins) do
        love.graphics.circle("fill", coin.x, coin.y, coin.radius)
    end
end

--Game Loop: main.lua uses callbacks (love.load, love.update, love.draw)