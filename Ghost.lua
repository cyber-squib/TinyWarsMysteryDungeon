--[[pod_format="raw",created="2026-07-28 21:22:58",modified="2026-07-28 21:23:16",revision=1]]
Ghost=_G.setmetatable({},Object)

Ghost.__index=Ghost

function Ghost:init(a)

  self.grid=24

  self.radius=10*self.grid
  
  if(not a)then a=0 end

  self.angle=a/4

  self.pace=1

  self.speed=-self.pace
  
  self.entrance=9.5
  
  if((self.angle-1/4)*2%1==0)then self.entrance=5.5 end

  return self

end

function Ghost:update()

  if self.speed==0 then

    if _G.btn(0) or _G.btn(1)
     or _G.btn(2) or _G.btn(3) then
   
      self.speed=-self.pace
    
      --self.aSpeed=-self.aPace
  
    end
  
  end
  
  self.radius+=self.speed
  
  if self.radius<self.grid*self.entrance and self.radius%(self.grid)==0 then
  
    self.speed=0
  
  end

end

function Ghost:draw()

  local r,a=self.radius,self.angle
  
  local x,y=240+_G.cos(a)*r,135+_G.sin(a)*r

  _G.circ(x,y,12,8)

end