--[[*********************************************
Bachelor of Software Engineering
Media Design School
Auckland
New Zealand
(c) Media Design School
File Name : levelScene.lua
Description : This is the level scene
Author : Joshua Tane
Mail : Joshua.Tane@mds.ac.nz
*********************************************--]]
require "player"
require "button"

CLevelScene = {}

-- //////////// Constructor ////////////
function CLevelScene:new(_obj)
  _obj = _obj or {}
  setmetatable(_obj, self)
  self.__index = self
  world = love.physics.newWorld(0, 9.81 * 64, true)
  world:setCallbacks(beginContact, endContact, preSolve, postSolve)

  -- Initialise all objects
  vecLevelObjects = {}
  player = CPlayer:new({
    vPosition = {
    x = love.graphics.getWidth()/2,
    y = love.graphics.getHeight()/2}
  })

  vecLevelObjects[1] = player

  menuButton = CButton:new({
    vPos = {x = 10, y = 10},
    vScale = {x = 100, y = 50},
    vColour = {r = 1, g = 1, b = 1, a = 1},
    strText = "BACK"
  })

  return _obj
end

-- //////////// Level Enter ////////////
function CLevelScene:Enter()
  player.rigidbody.body:setLinearVelocity(0,0)
  player.rigidbody.body:setX(love.graphics.getWidth()/2)
  player.rigidbody.body:setY(love.graphics.getHeight()/2)
end

-- //////////// Level Exit ////////////
function CLevelScene:Exit()
  bGamePaused = false

end

-- //////////// Level Update ////////////
function CLevelScene:Update(dt)
  if bGamePaused then
    menuButton:Update(vMouse.x, vMouse.y)
    if menuButton:IsPressed() then
      iCurrentScene = iCurrentScene - 1
      self.Exit()
      vecScenes[iCurrentScene]:Enter()
    end
    return nil
  end

  -- Update all objects
  for _, it in ipairs(vecLevelObjects) do
    it:Update(dt)
  end

  -- Update world
  world:update(dt)
end

-- //////////// Level Render ////////////
function CLevelScene:Render()
  -- Render all objects
  for _, it in ipairs(vecLevelObjects) do
    it:Render()
  end

  if bGamePaused then
    menuButton:Render()
  end

end

return CLevelScene;
