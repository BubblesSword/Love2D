--[[*********************************************
Bachelor of Software Engineering
Media Design School
Auckland
New Zealand
(c) Media Design School
File Name : pipeManager.lua
Description : This maintains the pipes
Author : Joshua Tane
Mail : Joshua.Tane@mds.ac.nz
*********************************************--]]
require "pipe"

CPipeManager = {
  vecPipePool = {},
  fSpeed = 0, -- 2
  iPipeAmount = 0 -- 5
}

-- //////////// Constructor ////////////
function CPipeManager:new (_obj)
_obj = _obj or {}
setmetatable(_obj, self)
self.__index = self

for i = 1, self.iPipeAmount + 1, 1 do
  local newPipe = CPipe:new({
    vOffset = {x = 0, y = 0},
    fSpeed = self.fSpeed,
    fGap = 10 * self.fSpeed,
    iState = 3
  })
   self.vecPipePool[#self.vecPipePool + 1] = newPipe
end

return _obj
end

-- //////////// Manager Update ////////////
function CPipeManager:Update(_dt)
  -- Update all pipes
  for _, it in ipairs(self.vecPipePool) do
    it:Update(_dt)
  end
end

-- //////////// Manager Render ////////////
function CPipeManager:Render()
  -- Render all pipes
  for _, it in ipairs(self.vecPipePool) do
    it:Render()
  end
end

return CPipeManager;
