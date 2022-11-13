--[[*********************************************
Bachelor of Software Engineering
Media Design School
Auckland
New Zealand
(c) Media Design School
File Name : player.lua
Description : This is the player class
Author : Joshua Tane
Mail : Joshua.Tane@mds.ac.nz
*********************************************--]]
anim8 = require("anim8-master/anim8")
require "rigidbody"

CPlayer = {
  rigidbody,
  vPosition = {x = 0, y = 0},
  fRotation = 0,
  vScale = {x = 0.25, y = 0.25}
}

-- //////////// Constructor ////////////
function CPlayer:new (_obj)
_obj = _obj or {}
setmetatable(_obj, self)
self.__index = self
self.fRotation = 0
self.vScale = {x = 0.25, y = 0.25}

self.rigidbody = CRigidbody:new( {
  body = love.physics.newBody(world, _obj.vPosition.x, _obj.vPosition.y, "dynamic")
})
self.rigidbody:AddFixture(love.physics.newCircleShape(20), 1, 0.6)

CreateAnimation(_obj.vPosition.x, _obj.vPosition.y)
return _obj
end

-- //////////// Player Animation ////////////
function CreateAnimation(_x, _y)
playerSprite = {}
playerSprite.x = _x
playerSprite.y = _y
playerSprite.walkSheet = love.graphics.newImage("Resources/Textures/player.png")
playerSprite.imageDimension = {playerSprite.walkSheet:getDimensions()}
playerSprite.width = 350
playerSprite.height = 300
playerSprite.walkGrid = anim8.newGrid(playerSprite.width, playerSprite.height, playerSprite.walkSheet:getWidth(), playerSprite.walkSheet:getHeight())
playerSprite.walkGridAnimation = anim8.newAnimation(playerSprite.walkGrid('1-6', 1), 0.10) -- update walkgrid with sprite sheet
CPlayer.playerSprite = playerSprite
end

-- //////////// Player Update ////////////
function CPlayer:Update(_dt)
  -- /// Callback functions///
  function love.keypressed(key, scancode, isrepeat)
    if key == "space" then
      self.rigidbody.body:setLinearVelocity(0,0)
      self.rigidbody.body:applyLinearImpulse(0, -700)
    end
    if key == "escape" then
      bGamePaused = not bGamePaused
    end
  end

  self.vPosition.x = self.rigidbody.body:getX()
  self.vPosition.y = self.rigidbody.body:getY()
  CPlayer.playerSprite.x = self.vPosition.x
  CPlayer.playerSprite.y = self.vPosition.y
  CPlayer.playerSprite.walkGridAnimation:update(_dt)
end

-- //////////// Player Render ////////////
function CPlayer:Render()
  CPlayer.playerSprite.walkGridAnimation:draw(
  CPlayer.playerSprite.walkSheet,
  CPlayer.playerSprite.x,
  CPlayer.playerSprite.y,
  0,
  CPlayer.vScale.x,
  CPlayer.vScale.y,
  CPlayer.playerSprite.width/2,
  CPlayer.playerSprite.height/2
)
end

return CPlayer;
