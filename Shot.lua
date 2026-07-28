--[[pod_format="raw",created="2026-07-28 21:20:31",modified="2026-07-28 21:20:31",revision=0]]
Shot=setmetatable({},Buff)

Shot.__index=Shot

function Shot:init(x,y,xSpeed,ySpeed,power)

  local parent=Buff
  
  self.xSpeed=xSpeed
  
  self.ySpeed=ySpeed
  
  self.power=power
  
  self.speed=2
  
  parent.init(self,x,y)

end

function Shot:update()

  local parent=Buff
  
  self.x+=self.xSpeed*self.speed
  
  self.y+=self.ySpeed*self.speed
  
  parent.update(self)

end

function Shot:draw()

  local m=sin(time()*6)*2
  
  local a,r=3,4
  
  local xm,ym=sin(time()*r)*a,cos(time()*r)*a

  circ(self.x+xm,self.y+ym,4+m,7)

end
