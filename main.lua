local Player = require("player")
local Coin = require("coin")

local player
local coins = {}
local score = 0
local coinTimer = 0
local coinSpawnTime = 1  -- Spawn a coin every second


function love.load()
    player = Player.new(1280/2 - 50, 650)  -- Create basket at bottom of screen
    coins = Coin.new(math.random(-50, 0), -50)
end
function love.update(dt)
    if love.keyboard.isDown("left") then --basquet moving left
        player.x = player.x - 400 * dt
    elseif love.keyboard.isDown("right") then --basquet moving right
        player.x = player.x + 400 * dt
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