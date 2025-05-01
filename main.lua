local Player = require("player")
local Coin = require("coin")


local player
local coins = {}
local score = 0
local coinTimer = 0
local coinSpawnTime = 1  -- Spawn a coin every second


function love.load()
    player = Player.new(1280/2 - 50, 650)  -- Create basket at bottom of screen
    x = math.random(1280 - Coin.diameter)
    table.insert(coins, Coin.new(x, -50))
end

function love.update(dt)
    --basquet movement 
    if love.keyboard.isDown("left") then --basquet moving left
        player.x = player.x - 400 * dt
    elseif love.keyboard.isDown("right") then --basquet moving right
        player.x = player.x + 400 * dt
    end
    --spawning after one second 
    coinTimer = coinTimer + dt --adds 1 second every 60 frames at 60 FPS
    if coinTimer == 2 then 
        table.insert(coins, Coin.new(x, -50))

        coinTimer = 0 -- reset the cointimer to 0. 
    end

end

function love.draw()
    love.graphics.setColor(0,0,1)
    love.graphics.rectangle("fill",player.x, player.y, player.width, player.height) --Player blue color 

    love.graphics.setColor(1,1,1) -- white color
    love.graphics.print("Score: " .. score, 10,10)

    love.graphics.setColor(1,0,0)
    love.graphics.circle("fill", coins.x, coins.y, coins.diameter)
end

--Game Loop: main.lua uses callbacks (love.load, love.update, love.draw)