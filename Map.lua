--[[pod_format="raw",created="2026-07-28 21:25:20",modified="2026-07-28 21:46:33",revision=9]]
Map=_G.setmetatable({},Object)

Map.__index=Map

function Map:init()

  self.grid=24

  self.x=-_G.flr(_G.rnd(8))*self.grid

  self.y=-_G.flr(_G.rnd(8))*self.grid

  self.xSpeed=0

  self.ySpeed=0

  self.pace=1

  self.xLast=Map.x

  self.yLast=Map.y
  
  self:generate()

  return self

end

function Map:generate()

  local x,y,w,h,xLast,yLast

  x,y=_G.flr(-self.x/24)+9,_G.flr(-self.y/24)+5
  
  xLast,yLast=x,y
  
  for n=1,2 do

    w,h=_G.flr(_G.rnd(2))+2,_G.flr(_G.rnd(2))+2
    
    --w,h=1,1
  
    for a=x-w,x+w do
  
      for b=y-h,y+h do
    
        _G.mset(a,b,4)
    
      end
  
    end
    
    local t,d,r
    
    t=5
    
    d=1
    
    if(xLast>x)then d*=-1 end
    
    r=_G.rnd(100)<50
    
    for a=xLast,x,d do
    
      if r then _G.mset(a,y,t)
      
      else _G.mset(a,yLast,t)
      
      end
    
    end
    
    d=1
    
    if(yLast>y)then d*=-1 end
    
    for b=yLast,y,d do
    
      if not r then _G.mset(x,b,t)
      
      else _G.mset(xLast,b,t)
      
      end
    
    end
    
    --t=6
    
    --_G.mset(xLast,y,t)

    --_G.mset(xLast,yLast,t)

    --_G.mset(x,y,t)

    --_G.mset(x,yLast,t)
    
    xLast,yLast=x,y
  
    x,y=_G.flr(_G.rnd(48)),_G.flr(_G.rnd(48))
  
  end
  
  _G.mset(xLast,yLast,3)

end

function Map:update()

  self.xLast=self.x
  
  self.yLast=self.y

  --_G.mset(_G.flr(-self.x/24)+9,_G.flr(-self.y/24)+5,3)
  
  --_G.mset(_G.ceil(-self.x/24)+9,_G.ceil(-self.y/24)+5,3)

  if self.ySpeed==0 then

    if(_G.btn(0))then self.xSpeed=self.pace end

    if(_G.btn(1))then self.xSpeed=-self.pace end
  
  end if self.xSpeed==0 then

    if(_G.btn(2))then self.ySpeed=self.pace end

    if(_G.btn(3))then self.ySpeed=-self.pace end
  
  end
  
  self.x+=self.xSpeed
  
  self.y+=self.ySpeed
  
  local loWall=_G.fget(_G.mget(_G.flr(-self.x/24)+9,_G.flr(-self.y/24)+5,3),0)
  
  local hiWall=_G.fget(_G.mget(_G.ceil(-self.x/24)+9,_G.ceil(-self.y/24)+5,3),0)
  
  local wall=loWall or hiWall
  
  if wall then self:halt() end
  
  local loStairs=_G.fget(_G.mget(_G.flr(-self.x/24)+9,_G.flr(-self.y/24)+5,3),1)
  
  local hiStairs=_G.fget(_G.mget(_G.ceil(-self.x/24)+9,_G.ceil(-self.y/24)+5,3),1)
  
  local stairs=loStairs or hiStairs
  
  if(stairs and self.x%self.grid==0 and self.y%self.grid==0)then self:leave() end
  
  if(self.x%self.grid==0)then self.xSpeed=0 end

  if(self.y%self.grid==0)then self.ySpeed=0 end

end

function Map:leave()

  --self:exit()
  
  _final()
  
  _init()

end

function Map:halt()

  self.x=self.xLast
  
  self.y=self.yLast
  
  self.xSpeed=0
  
  self.ySpeed=0

end

function Map:draw()

  _G.map(0,0,self.x+12,self.y+3)

end

function Map:final()

  local w,h=64,64
  
  for a=0,w do
  
    for b=0,h do
    
      _G.mset(a,b,1)
    
    end
    
  end

end

function Map:destroy()

  local parent=_G.getmetatable(_G.getmetatable(self))
  
  self:final()
  
  parent.destroy(self)

end

function Map:associate(other)

  local type=_G.getmetatable(other)
  
  if type==Ghost then
  
    self:associateGhost(other)
    
  elseif type==Player then
  
    self:associatePlayer(other)
  
  end

end

function Map:associateGhost(other)

  local a=other.angle*4%4

  if self.xSpeed<0 then
  
    if(a==0)then other.radius+=other.speed end
    
    if(a==2)then

      other.radius-=other.speed

      other.speed=0

    end
  
  elseif self.xSpeed>0 then
  
    if(a==2)then other.radius+=other.speed end
    
    if(a==0)then

      other.radius-=other.speed

      other.speed=0

    end
  
  elseif self.ySpeed<0 then
  
    if(a==3)then other.radius+=other.speed end
    
    if(a==1)then

      other.radius-=other.speed

      other.speed=0

    end
  
  elseif self.ySpeed>0 then
  
    if(a==1)then other.radius+=other.speed end
    
    if(a==3)then

      other.radius-=other.speed

      other.speed=0

    end
  
  end

end

function Map:associatePlayer(other)

  if other.charge>0 then
  
    self:halt()
  
  end

end