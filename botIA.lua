
BotIA = {}

function BotIA:load()
  self:initBotIA()
end

function BotIA:initBotIA()
  self.width = love.graphics.getHeight() / 50
  self.height = love.graphics.getHeight() / 6
  self.x = love.graphics.getWidth() - self.width*1.3 - love.graphics.getWidth() / 100
  self.y = love.graphics.getHeight() / 2 - self.height / 2
  self.speed = 520
end

function BotIA:update(dt)
  self:move(dt)
  self:checkBoundaries()
end

function BotIA:move(dt)
  if Ball.y + Ball.height/2 < self.y + self.height * 0.44 then
    self.y = self.y - self.speed * dt 
  elseif Ball.y >= self.y + self.height then
    self.y = self.y + self.speed * dt 
  else
    return
  end
end

function BotIA:checkBoundaries()
  if self.y < 0 then
    self.y = 0
  elseif self.y + self.height > love.graphics.getHeight() then
    self.y = love.graphics.getHeight() - self.height
  end
end

function BotIA:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end