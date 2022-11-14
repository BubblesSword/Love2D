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
require "pipesManager"

CLevelScene = {}

-- //////////// Constructor ////////////
function CLevelScene:new(_obj)
  _obj = _obj or {}
  setmetatable(_obj, self)
  self.__index = self
  world = love.physics.newWorld(0, 9.81 * 64, true)
  world:setCallbacks(beginContact, endContact, preSolve, postSolve)

  bGameOver = false
  iCurrentScore = 0
  currentScoreText = ""
  levelMusic = love.audio.newSource("Resources/Audio/Nyan Cat.wav", "stream")
  levelMusic:setLooping(true)

  -- Initialise all objects
  vecLevelObjects = {}
  player = CPlayer:new({
    vOrigin = {
    x = love.graphics.getWidth()/2 - 200,
    y = love.graphics.getHeight()/2}
  })
  pipeManager = CPipeManager:new({
      fSpeed = 2,
      iPipeAmount = 5
  })
  vecLevelObjects[1] = player
  vecLevelObjects[2] = pipeManager

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
  player.rigidbody.body:setX(player.vOrigin.x)
  player.rigidbody.body:setY(player.vOrigin.y)
  levelMusic:play()
  pipeManager:Reset()

end

-- //////////// Level Exit ////////////
function CLevelScene:Exit()
  bGamePaused = false
  bGameOver = false
  levelMusic:stop()
  if iCurrentScore > iHighScore then
    iHighScore = iCurrentScore
    iCurrentScore = 0
  end
end

-- //////////// Level Update ////////////
function CLevelScene:Update(_dt)
  if bGamePaused or bGameOver then
    menuButton:Update(vMouse.x, vMouse.y)
    if menuButton:IsPressed() then
      iCurrentScene = iCurrentScene - 1
      self.Exit()
      vecScenes[iCurrentScene]:Enter()
    end
    return nil
  else
    currentScoreText = "SCORE " .. math.floor(iCurrentScore)
    iCurrentScore = iCurrentScore + _dt
  end

  -- Update all objects
  for _, it in ipairs(vecLevelObjects) do
    it:Update(_dt)
  end


  if player.rigidbody.body:getX() < 10 or player.rigidbody.body:getY() > love.graphics.getHeight() or  player.rigidbody.body:getY() < 0 then
    bGameOver = true
  end

  -- Update world
  world:update(_dt)
end

-- //////////// Level Render ////////////
function CLevelScene:Render()
  -- Render all objects
  for _, it in ipairs(vecLevelObjects) do
    it:Render()
  end

-- render score
  love.graphics.print(currentScoreText,
  love.graphics.getWidth()/2 - font:getWidth(currentScoreText)/2,
  10)

-- render game over
  if bGameOver then
    menuButton:Render()
    love.graphics.print("GAME OVER",
    love.graphics.getWidth()/2 - font:getWidth("GAME OVER")/2,
    love.graphics.getHeight()/2 - font:getHeight("GAME OVER")/2)
    -- render back button
  elseif bGamePaused then
    menuButton:Render()
  end

end

return CLevelScene;
