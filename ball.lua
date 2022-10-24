
Ball = {}


function Ball:load()
  self:initBall()
  self.scoreP1 = 0
  self.scoreP2 = 0
end

function Ball:initBall()
 
  self.width = love.graphics.getHeight() / 50
  self.height = love.graphics.getHeight() / 50
  self.x = love.graphics.getWidth() / 2 - self.width / 2
  self.y = love.graphics.getHeight() / 2 - self.height / 2
  self.speed = 300
  rand1 = love.math.random( -1, 1) 
  if rand1 == 0 then rand1 = 1 end
  rand2 = love.math.random( -1, 1) 
  if rand2 == 0 then rand1 = 1 end
    
  self.xVel = self.speed * rand1
  self.yVel = self.speed * rand2
end

function Ball:update(dt)
  self:move(dt)
  self:collide()
  self:checkBoundaries()
end

function Ball:move(dt)
  self.x = self.x + self.xVel * dt
  self.y = self.y + self.yVel * dt
end

function Ball:collide()
  if checkCollision(self, Player) then 
    self.xVel = -self.xVel*1.2
    local middeBall = self.y + self.height / 2
    local middePlayer = Player.y + Player.height / 2
    local collisionPoint = middeBall - middePlayer
    self.yVel = collisionPoint * 10
    
  end
  if checkCollision(self, BotIA) then
    self.xVel = -self.xVel*1.2
    local middeBall = self.y + self.height / 2
    local middeBot = BotIA.y + BotIA.height / 2
    local collisionPoint = middeBall - middeBot
    self.yVel = collisionPoint * 10
    
  end
end

function Ball:checkBoundaries()
  self:yBoundaries()
  self:xBoundaries()
end

function Ball:yBoundaries()
  if self.y < 0 then
    self.y = 0
    self.yVel = -self.yVel
  elseif self.y + self.height > love.graphics.getHeight() then
    self.y = love.graphics.getHeight() - self.height
    self.yVel = -self.yVel
  end
end
function Ball:xBoundaries()
  if Ball.x >= love.graphics.getWidth() then
    self.scoreP1 = self.scoreP1 + 1
    self:initBall()
  elseif Ball.x <= 0 then
    self.scoreP2 = self.scoreP2 + 1
    self:initBall()
  end
end

function Ball:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
