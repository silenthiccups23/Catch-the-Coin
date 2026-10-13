local Player = require("player")
local Coin = require("coin")

local player
local coins = {}
local score = 0
local coinTimer = 0
local coinSpawnTime = 1 -- Spawn a coin every second
local BOTTOM_MARGIN = 40

local function randomCoinX(radius)
    local w = love.graphics.getWidth()
    local minX = radius
    local maxX = w - radius
    if maxX < minX then
        return w / 2
    end
    return math.random(minX, maxX)
end

local function clampPlayerToScreen()
    local w = love.graphics.getWidth()
    local h = love.graphics.getHeight()
    player.y = h - player.height - BOTTOM_MARGIN
    player.x = math.max(0, math.min(w - player.width, player.x))
end

function love.load()
    player = Player.new(0, 0)
    clampPlayerToScreen()
    player.x = love.graphics.getWidth() / 2 - player.width / 2
    table.insert(coins, Coin.new(randomCoinX(16), -50))
end

function love.update(dt)
    updatePlayer(dt)
    updateCoins(dt)
    checkCollisions()
    spawnCoins(dt)
end

function love.draw()
    love.graphics.setColor(0, 0, 1)
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)

    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Score: " .. score, 10, 10)

    love.graphics.setColor(1, 0, 0)
    for _, coin in ipairs(coins) do
        love.graphics.circle("fill", coin.x, coin.y, coin.radius)
    end
end

function updatePlayer(dt)
    if love.keyboard.isDown("left") then
        player.x = player.x - player.speed * dt
    end
    if love.keyboard.isDown("right") then
        player.x = player.x + player.speed * dt
    end
    clampPlayerToScreen()
end

function updateCoins(dt)
    local h = love.graphics.getHeight()
    for i = #coins, 1, -1 do
        local coin = coins[i]
        coin.y = coin.y + coin.speed * dt
        if coin.y - coin.radius > h then
            table.remove(coins, i)
        end
    end
end

function checkCollisions()
    for i = #coins, 1, -1 do
        local coin = coins[i]
        local closestX = math.max(player.x, math.min(player.x + player.width, coin.x))
        local closestY = math.max(player.y, math.min(player.y + player.height, coin.y))

        local dx = closestX - coin.x
        local dy = closestY - coin.y
        local distance = math.sqrt(dx * dx + dy * dy)

        if distance <= coin.radius then
            score = score + 1
            table.remove(coins, i)
        end
    end
end

function spawnCoins(dt)
    coinTimer = coinTimer + dt
    if coinTimer >= coinSpawnTime then
        table.insert(coins, Coin.new(randomCoinX(16), -50))
        coinTimer = coinTimer - coinSpawnTime
    end
end
