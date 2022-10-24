require("player")
require("ball")
require("botIA")

local font = love.graphics.newFont("insane_hours_2.ttf", 16)


function love.load()
  Player:load()
  Ball:load()
  BotIA:load()
  pause = true
  win = false
  winText= ""
  pauseText = "Espacio = pausar"
end

function love.update(dt)
  if love.keyboard.isDown("space") then
    pause = not pause
  end
  if not pause and not win then 
    Player:update(dt)
    Ball:update(dt)
    BotIA:update(dt)
  end
  if Ball.scoreP1 >= 7 or Ball.scoreP2 >= 7 then
    win = true
    if Ball.scoreP1 >= 7 then winText= "Jugador 1 Gano!" else winText= "Jugador 2 Gano!" end
    if love.keyboard.isDown("space") then love.load() end
  end
end

function checkCollision(rec1, rec2)
  return rec1.x + rec1.width >= rec2.x and rec1.x <= rec2.x + rec2.width and rec1.y + rec1.height >= rec2.y and rec1.y <= rec2.y + rec2.height
end

function love.draw()
  Player:draw()
  Ball:draw()
  BotIA:draw()
  love.graphics.setFont(font)
  love.graphics.print(pauseText, love.graphics.getWidth() / 8, love.graphics.getHeight() * 0.94)
  love.graphics.print("Mantener espacio = slow motion", love.graphics.getWidth() / 1.9, love.graphics.getHeight() * 0.94)
  love.graphics.print(winText, love.graphics.getWidth() / 5, love.graphics.getHeight() / 2)
  love.graphics.rectangle("fill", love.graphics.getWidth() / 2 - love.graphics.getWidth() / 180, 0, love.graphics.getWidth() / 90, love.graphics.getHeight())
  love.graphics.print(Ball.scoreP2, love.graphics.getWidth() / 1.5, love.graphics.getHeight() / 100)
  love.graphics.print(Ball.scoreP1, love.graphics.getWidth() / 4, love.graphics.getHeight() / 100)
end

