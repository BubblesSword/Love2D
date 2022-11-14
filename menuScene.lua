--[[*********************************************
Bachelor of Software Engineering
Media Design School
Auckland
New Zealand
(c) Media Design School
File Name : menuScene.lua
Description : This is the menu scene
Author : Joshua Tane
Mail : Joshua.Tane@mds.ac.nz
*********************************************--]]
require "button"

CMenuScene = {}

-- //////////// Constructor ////////////
function CMenuScene:new (_obj)
_obj = _obj or {}
setmetatable(_obj, self)
self.__index = self

playButton = CButton:new({
  vPos = {x = love.graphics.getWidth()/2 - 50, y = love.graphics.getHeight()/2 - 125},
  vScale = {x = 100, y = 50},
  vColour = {r = 1, g = 1, b = 1, a = 1},
  strText = "PLAY"
})

quitButton = CButton:new({
  vPos = {x = love.graphics.getWidth()/2 - 50, y = love.graphics.getHeight()/2 - 25},
  vScale = {x = 100, y = 50},
  vColour = {r = 1, g = 1, b = 1, a = 1},
  strText = "QUIT"
})

iHighScore = 0
highScoreText = "HIGHSCORE"

return _obj
end


-- //////////// Menu Enter ////////////
function CMenuScene:Enter()
  highScoreText = "HIGHSCORE " .. iHighScore
end

-- //////////// Menu Exit ////////////
function CMenuScene:Exit()

end


-- //////////// Menu Update ////////////
function CMenuScene:Update(_dt)
  playButton:Update(vMouse.x, vMouse.y)
  quitButton:Update(vMouse.x, vMouse.y)

  if playButton:IsPressed() then
    iCurrentScene = iCurrentScene + 1
    self.Exit()
    vecScenes[iCurrentScene]:Enter()
  end

  if quitButton:IsPressed() then
    love.window.close( )
  end

end

-- //////////// Menu Render ////////////
function CMenuScene:Render()
  playButton:Render()
  quitButton:Render()
  love.graphics.print(highScoreText, love.graphics.getWidth()/2 - font:getWidth(highScoreText)/2, 100)
end

return CMenuScene;
