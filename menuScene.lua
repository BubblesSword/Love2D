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
playButton = CButton:new(nil, 200, 200, 100, 50, "PLAY")
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
  end

  if playButton:IsPressed() then
    iCurrentScene = iCurrentScene + 1
  end

end

-- //////////// Menu Render ////////////
function CMenuScene:Render()
  playButton:Render() 
end

return CMenuScene;
