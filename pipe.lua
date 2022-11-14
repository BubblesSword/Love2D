--[[*********************************************
Bachelor of Software Engineering
Media Design School
Auckland
New Zealand
(c) Media Design School
File Name : Pipe.lua
Description : This is the pipes
Author : Joshua Tane
Mail : Joshua.Tane@mds.ac.nz
*********************************************--]]
require "rigidbody"

CPipe = {
  vScale = {x = 0.5, y = 0.5},
  rigidbody,
  sprite,
  fOffset = 0,
  fSpeed = 0,
  -- fGap = 0,
  -- iState = 0
}

-- //////////// Constructor ////////////
function CPipe:new (_obj)
_obj = _obj or {}
setmetatable(_obj, self)
self.__index = self
self.rigidbody = CRigidbody:new({
  body = love.physics.newBody(world, math.random(50, love.graphics.getHeight() - 50), fOffset, "kinematic")
})

self.sprite = love.graphics.newImage("Resources/Sprites/vacum.png")
self.rigidbody:AddFixture(love.physics.newRectangleShape(self.sprite:getWidth()/4 * self.vScale.x, self.sprite:getHeight() * self.vScale.x), 1, 0.6)
return _obj
end

-- //////////// Reset Pipe ////////////
function CPipe:Reset()
-- set top and bottom 1 = top   2 = bottom   3 = both
-- set offset 10 * speed + rng
-- set gap -- clamp
  self.rigidbody.body:setY(math.random(50, love.graphics.getHeight() - 50))
  self.rigidbody.body:setX(love.graphics.getWidth() + self.sprite:getWidth())
end

-- //////////// Pipe Update ////////////
function CPipe:Update(_dt)
  -- move pipe left
  self.rigidbody.body:setX(self.rigidbody.body:getX() - _dt * 200)

  -- if moved offscreen reset pipe
  if self.rigidbody.body:getX() < - 10 then
    self:Reset()
  end
end

-- //////////// Pipe Render ////////////
function CPipe:Render()
  love.graphics.draw(self.sprite, self.rigidbody.body:getX(), self.rigidbody.body:getY(), 0, self.vScale.x, self.vScale.y, self.sprite:getWidth()/2, self.sprite:getHeight()/2)
end

return CPipe;
