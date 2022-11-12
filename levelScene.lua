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
  -- world = love.physics.newWorld(0, 9.81 * 64, true)
  -- world:setCallbacks(beginContact, endContact, preSolve, postSolve)
  player = CPlayer:new(nil, 200, 200)

  return _obj
end

-- //////////// Level Update ////////////
function CLevelScene:Update(dt)
  player:Update(dt)
end

-- //////////// Level Render ////////////
function CLevelScene:Render()
  player:Render()

end

return CLevelScene;
