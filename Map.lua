--[[pod_format="raw",created="2026-07-28 21:25:20",modified="2026-07-28 21:25:28",revision=1]]
Map=setmetatable({},Object)

Map.__index=Map

function Map:init()

  self.grid=24

  self.x=-flr(rnd(8))*self.grid

  self.y=-flr(rnd(8))*self.grid

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

  x,y=flr(-self.x/24)+9,flr(-self.y/24)+5
  
  xLast,yLast=x,y
  
  for n=1,2 do

    w,h=flr(rnd(2))+2,flr(rnd(2))+2
    
    --w,h=1,1
  
    for a=x-w,x+w do
  
      for b=y-h,y+h do
    
        mset(a,b,4)
    
      end
  
    end
    
    local t,d,r
    
    t=5
    
    d=1
    
    if(xLast>x)then d*=-1 end
    
    r=rnd(100)<50
    
    for a=xLast,x,d do
    
      if r then mset(a,y,t)
      
      else mset(a,yLast,t)
      
      end
    
    end
    
    d=1
    
    if(yLast>y)then d*=-1 end
    
    for b=yLast,y,d do
    
      if not r then mset(x,b,t)
      
      else mset(xLast,b,t)
      
      end
    
    end
    
    --t=6
    
    --mset(xLast,y,t)

    --mset(xLast,yLast,t)

    --mset(x,y,t)

    --mset(x,yLast,t)
    
    xLast,yLast=x,y
  
    x,y=flr(rnd(48)),flr(rnd(48))
  
  end
  
  mset(xLast,yLast,3)

end

function Map:update()

  self.xLast=self.x
  
  self.yLast=self.y

  --mset(flr(-self.x/24)+9,flr(-self.y/24)+5,3)
  
  --mset(ceil(-self.x/24)+9,ceil(-self.y/24)+5,3)

  if self.ySpeed==0 then

    if(btn(0))then self.xSpeed=self.pace end

    if(btn(1))then self.xSpeed=-self.pace end
  
  end if self.xSpeed==0 then

    if(btn(2))then self.ySpeed=self.pace end

    if(btn(3))then self.ySpeed=-self.pace end
  
  end
  
  self.x+=self.xSpeed
  
  self.y+=self.ySpeed
  
  local loWall=fget(mget(flr(-self.x/24)+9,flr(-self.y/24)+5,3),0)
  
  local hiWall=fget(mget(ceil(-self.x/24)+9,ceil(-self.y/24)+5,3),0)
  
  local wall=loWall or hiWall
  
  if(wall)then self:halt() end
  
  local loStairs=fget(mget(flr(-self.x/24)+9,flr(-self.y/24)+5,3),1)
  
  local hiStairs=fget(mget(ceil(-self.x/24)+9,ceil(-self.y/24)+5,3),1)
  
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

  map(0,0,self.x+12,self.y+3)

end

function Map:final()

  local w,h=64,64
  
  for a=0,w do
  
    for b=0,h do
    
      mset(a,b,1)
    
    end
    
  end

end

function Map:destroy()

  local parent=getmetatable(getmetatable(self))
  
  self:final()
  
  parent.destroy(self)

end

function Map:associate(other)

  local type=getmetatable(other)
  
  if type==Ghost then
  
    self:associateGhost(other)
  
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