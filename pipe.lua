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

CPipe = {
  fOffset = 0,
  fSpeed = 0,
  fGap = 0,
  iState = 0
}

-- //////////// Constructor ////////////
function CPipe:new (_obj)
_obj = _obj or {}
setmetatable(_obj, self)
self.__index = self
return _obj
end

-- //////////// Reset Pipe ////////////
function CPipe:Reset()
-- set top and bottom 1 = top   2 = bottom   3 = both


-- set offset 10 * speed + rng


-- set gap -- clamp


end

-- //////////// Pipe Update ////////////
function CPipe:Update(_dt)

end

-- //////////// Pipe Render ////////////
function CPipe:Render()

end

return CPipe;
