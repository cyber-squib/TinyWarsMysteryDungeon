--[[pod_format="raw",created="2026-07-28 21:26:27",modified="2026-07-28 21:26:27",revision=0]]
Player=setmetatable({},Fighter)

Player.__index=Player

function Player:init(...)

  assert(not _debug)

  --local parent1=getmetatable(self)
  local parent2=Fighter
  --local parent2=Fighter
  
  --assert(false)
  
  --assert(parent2!=Fighter)
  
  --assert(false)
  
  --_debugger:classType(getmetatable(self))
  
  --local c=getmetatable(self)
  --c=parent
  --assert(c!=Ensemble)
  --assert(c!=Object)
  --assert(c!=Notice)
  --assert(c!=Enemy)
  --assert(c!=Player)
  --assert(c!=Map)
  --assert(c!=GhostlyNewcomer)
  --assert(c!=Ghost)
  --assert(c!=Newcomer)
  --assert(c!=Shield)
  --assert(c!=Buff)
  --assert(c!=Fighter)
  --assert(c!=Debugger)
  --assert(false)

  self.x=240
  
  self.y=135
  
  --assert(parent1==Player)
  --assert(parent2==Fighter)
  
  --assert(false)

  local r=parent2.init(self,...) --PROOOOOOOBLEM
  
  --assert(false)
  
  return r

end

function Player:draw()

  circ(240,135,12,8)
  
  self:drawStats()

end

function Player:drawStats()

  --assert(self.charge==0)

  print("CHARGE:"..self.charge,8,8,8)

end

function Player:associate(other)

  local type=getmetatable(other)
  
  if type==Enemy
   or type==Ghost
   then
  
    self:brace(other)
  
  end

end

function Player:brace(other)

  local r,a=other.radius,other.angle
  
  local x2,y2=240+cos(a)*r,135+sin(a)*r
  
  local x1,y1=self.x,self.y
  
  local d=12

  if abs(x1-x2)<d and abs(y1-y2)<d then
  
    other:destroy()
  
  end

end