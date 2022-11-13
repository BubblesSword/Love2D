--[[*********************************************
Bachelor of Software Engineering
Media Design School
Auckland
New Zealand
(c) Media Design School
File Name : rigidbody.lua
Description : This is usedd to create physics objects
Author : Joshua Tane
Mail : Joshua.Tane@mds.ac.nz
*********************************************--]]

CRigidbody = {
  body,
  vecFixture = {}
}

-- //////////// Constructor ////////////
function CRigidbody:new(_obj)
  _obj = _obj or {}
  setmetatable(_obj, self)
  self.__index = self
  self.vecFixture = {}
  return _obj
end

-- //////////// Add Fixture ////////////
function CRigidbody:AddFixture(_shape, _density, _restitution)
  self.vecFixture[#self.vecFixture + 1] = love.physics.newFixture(self.body, _shape, _density)
  -- self.vecFixture[#self.vecFixture + 1]:setRestitution(_restitution)
end

return CRigidbody;
