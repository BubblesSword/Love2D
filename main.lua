--[[*********************************************
Bachelor of Software Engineering
Media Design School
Auckland
New Zealand
(c) Media Design School
File Name : main.lua
Description : This is the main thread
Author : Joshua Tane
Mail : Joshua.Tane@mds.ac.nz
*********************************************--]]
require "menuScene"
require "levelScene"

-- //////////// Game Constructor ////////////
function love.load(arg)
  -- Initialise scenes
  vecScenes = {}
  vecScenes[1] = CMenuScene:new(nil)
  vecScenes[2] = CLevelScene:new(nil)
  iCurrentScene = 1

  font = love.graphics.newFont(32) 
end

-- //////////// Update Game ////////////
function love.update(dt)
  vecScenes[iCurrentScene]:Update(dt)
end

-- //////////// Render Game ////////////
function love.draw()
  vecScenes[iCurrentScene]:Render()
end
