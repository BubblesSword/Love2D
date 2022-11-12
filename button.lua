--[[*********************************************
Bachelor of Software Engineering
Media Design School
Auckland
New Zealand
(c) Media Design School
File Name : button.lua
Description : This is used to create buttons
Author : Joshua Tane
Mail : Joshua.Tane@mds.ac.nz
*********************************************--]]
require "helper"

CButton = {
  vPos = {x = 0, y = 0},
  vScale = {x = 200, y = 100},
  bHover = false,
  bClicked = false,
  vColour = {r = 1, g = 1, b = 1, a = 1},
  strText = ""
}

-- //////////// Constructor ////////////
function CButton:new (_obj) -- , _x, _y, _w, _h, _text
_obj = _obj or {}
setmetatable(_obj, self)
self.__index = self
-- self.vPos =  {x = _x, y = _y}
-- self.vScale = {x = _w, y = _h}
-- self.bHover = false
-- self.bClicked = false
-- self.vColour = {r = 0.5, g = 0.5, b = 0.5, a = 1}
-- self.strText = _text
return _obj
end

-- //////////// Button Check ////////////
function CButton:IsPressed()
  return ternary(love.mouse.isDown(1) and self.bHover,true,false) or nil
end

-- //////////// Button Update ////////////
function CButton:Update(x, y)
  self.bHover = ternary(x >= self.vPos.x and x <= self.vPos.x + self.vScale.x and y >= self.vPos.y and y <= self.vPos.y + self.vScale.y,true,false)
  self.vColour = ternary(self.bHover, {r = 0.5, g = 0.5, b = 0.5, a = 1}, {r = 0.5, g = 0.5, b = 0.5, a = 0.5})
end

-- //////////// Button Render ////////////
function CButton:Render()
  love.graphics.setColor(self.vColour.r, self.vColour.g, self.vColour.b, self.vColour.a)
  love.graphics.rectangle("fill", self.vPos.x, self.vPos.y, self.vScale.x, self.vScale.y)
  love.graphics.setColor( 1, 1, 1 );
  love.graphics.setFont(font)
  local x = self.vPos.x - font:getWidth(self.strText)/2 + self.vScale.x/2
  local y = self.vPos.y - font:getHeight(self.strText)/2 + self.vScale.y/2
  love.graphics.print(self.strText, x, y)
end

return CButton;






















--
