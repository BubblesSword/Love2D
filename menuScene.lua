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

vecObjects = {}
playButton = CButton:new({
  vPos = {x = love.graphics.getWidth()/2, y = love.graphics.getHeight()/2 - 100},
  vScale = {x = 100, y = 50},
  bHover = false,
  bClicked = false,
  vColour = {r = 1, g = 1, b = 1, a = 1},
  strText = "PLAY"
})

quitButton = CButton:new({
  vPos = {x = love.graphics.getWidth()/2, y = love.graphics.getHeight()/2},
  vScale = {x = 100, y = 50},
  bHover = false,
  bClicked = false,
  vColour = {r = 1, g = 1, b = 1, a = 1},
  strText = "QUIT"
})

return _obj
end

-- //////////// Menu Update ////////////
function CMenuScene:Update(dt)
  -- /// Callback functions///
  function love.keypressed(key, scancode, isrepeat)
    if key == "space" then end
  end

  function love.mousemoved( x, y, dx, dy, istouch )
    playButton:Update(x, y)
    quitButton:Update(x, y)
  end

  if playButton:IsPressed() then
    iCurrentScene = iCurrentScene + 1
  end

  if quitButton:IsPressed() then
    love.window.close( )
  end

end

-- //////////// Menu Render ////////////
function CMenuScene:Render()
  playButton:Render()
  quitButton:Render()
end

return CMenuScene;
