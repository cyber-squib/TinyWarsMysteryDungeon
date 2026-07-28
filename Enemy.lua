--[[pod_format="raw",created="2026-07-28 21:27:44",modified="2026-07-28 21:27:44",revision=0]]
Enemy=setmetatable({},Object)

Enemy.__index=Enemy

function Enemy:init()

  self.grid=24

  self.radius=10*self.grid

  self.angle=flr(rnd(4))/4

  self.pace=1

  self.speed=-4

  self.aGrid=1/8

  self.aPace=1/2^8

  if(rnd(2)>1)then self.aPace*=-1 end

  self.aSpeed=0

  return self

end

function Enemy:update()

  if self.speed==0 and self.aSpeed==0 then

    if btnp(0) or btnp(1)
     or btnp(2) or btnp(3) then
   
      self.speed=-self.pace
    
      self.aSpeed=-self.aPace
  
    end
  
  end
  
  self.radius+=self.speed
  
  self.angle+=self.aSpeed
  
  if self.radius<self.grid*5.5 and self.radius%(self.grid/2)==0 then
  
    self.speed=0
  
  end
  
  if self.angle%self.aGrid==0 then
  
    self.aSpeed=0
  
  end

end

function Enemy:draw()

  local r,a=self.radius,self.angle
  
  local x,y=240+cos(a)*r,135+sin(a)*r

  circ(x,y,12,8)

end