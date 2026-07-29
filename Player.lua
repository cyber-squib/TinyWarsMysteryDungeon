--[[pod_format="raw",created="2026-07-28 21:26:27",modified="2026-07-28 21:26:27",revision=0]]
Player=_G.setmetatable({},Fighter)

Player.__index=Player

function Player:init(...)

  _G.assert(not _debug)

  --local parent1=_G.getmetatable(self)
  local parent2=Fighter
  --local parent2=Fighter
  
  --_G.assert(false)
  
  --_G.assert(parent2!=Fighter)
  
  --_G.assert(false)
  
  --_debugger:classType(_G.getmetatable(self))
  
  --local c=_G.getmetatable(self)
  --c=parent
  --_G.assert(c!=Ensemble)
  --_G.assert(c!=Object)
  --_G.assert(c!=Notice)
  --_G.assert(c!=Enemy)
  --_G.assert(c!=Player)
  --_G.assert(c!=Map)
  --_G.assert(c!=GhostlyNewcomer)
  --_G.assert(c!=Ghost)
  --_G.assert(c!=Newcomer)
  --_G.assert(c!=Shield)
  --_G.assert(c!=Buff)
  --_G.assert(c!=Fighter)
  --_G.assert(c!=Debugger)
  --_G.assert(false)

  self.x=240
  
  self.y=135
  
  --_G.assert(parent1==Player)
  --_G.assert(parent2==Fighter)
  
  --_G.assert(false)

  local r=parent2.init(self,...) --PROOOOOOOBLEM
  
  --_G.assert(false)
  
  return r

end

function Player:draw()

  _G.circ(240,135,12,8)
  
  self:drawStats()

end

function Player:drawStats()

  --_G.assert(self.charge==0)

  _G.print("CHARGE:"..self.charge,8,8,8)

end

function Player:associate(other)

  local type=_G.getmetatable(other)
  
  if type==Enemy
   or type==Ghost
   then
  
    self:brace(other)
  
  end

end

function Player:brace(other)

  local r,a=other.radius,other.angle
  
  local x2,y2=240+_G.cos(a)*r,135+_G.sin(a)*r
  
  local x1,y1=self.x,self.y
  
  local d=12

  if _G.abs(x1-x2)<d and _G.abs(y1-y2)<d then
  
    other:destroy()
  
  end

end