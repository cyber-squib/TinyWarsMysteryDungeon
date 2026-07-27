

--[[

function _final
function _init

function Ensemble:init
function Ensemble:create
function Ensemble:update
function Ensemble:draw
function Ensemble:add
function Ensemble:del
function Ensemble:destroy

function Object:init
function Object:create
function Object:destroy
function Object:exit
function Object:update
function Object:draw
function Object:associate

function Notice:init
function Notice:span
function Notice:update
function Notice:draw
function Notice:final

function Enemy:init
function Enemy:update
function Enemy:draw

function Player:update
function Player:draw
function Player:associate
function Player:brace

function Map:init
function Map:generate
function Map:update
function Map:leave
function Map:halt
function Map:draw
function Map:final
function Map:destroy
function Map:associate
function Map:associateGhost

function GhostlyNewcomer:update

function Ghost:init
function Ghost:update
function Ghost:draw

function Newcomer:update

--]]


----------------------------------------------------------------


--_debug=true

function _final()

  _ensemble:destroy()
  
  _num+=1
  
  --Ensemble.objects={}

end

_num=1

function _init()

  vid()
  
  palt(0,false)
  
  --Ensemble:init():create()
  Ensemble:init():create()
  
  --Debugger:init():create()
  
  --Notice:init(_num):create()
  Notice:stick(_num)

end


----------------------------------------------------------------


Ensemble={}

Ensemble.__index=Ensemble

function Ensemble:init()

  self.objects={}
  
  return self

end

function Ensemble:create()

  _ensemble=setmetatable({},self)
  
  _update=function()

    _ensemble:update()

  end

  _draw=function()

    _ensemble:draw()

  end
  
  return _ensemble

end

function Ensemble:update()

  for i=#self.objects,1,-1 do
  
    local o=self.objects[i]
    
    if(o and o.update)then o:update() end
    
    for j=#self.objects,1,-1 do
    
      local p=self.objects[j]
      
      if(o!=p and o and p and o.associate)then o:associate(p) end
    
    end
  
  end

end

function Ensemble:draw()

  cls()

  for i=#self.objects,1,-1 do
  
    local o=self.objects[i]
    
    if(o and o.draw)then o:draw() end
  
  end

end

function Ensemble:add(o,n)
  
  return add(self.objects,o,n)

end

function Ensemble:del(o)

  return del(self.objects,o)

end

function Ensemble:destroy()

  local o=self.objects[#self.objects]
  
  local t=getmetatable(o)
  
  assert(t==Map)
  
  o:destroy()
  
  --assert(false,"FIX THIS SHIT!")

  --[[

  for i=#self.objects,1,-1 do
  
    local o=self.objects[i]
    
    if(o and o.destroy)then o:destroy() end
    
    --break
    
    i+=1
  
  end
  
  --]]

  _ensemble=nil
  
  _update=nil
  
  _draw=nil

end


----------------------------------------------------------------


Object={}

Object.__index=Object

function Object:init()

  return self

end

function Object:create(n)

  local o=setmetatable({},self)

  return _ensemble:add(o,n)

end

function Object:stick(...)

  self:create():init(...)

end

function Object:stack(...)

  self:create(1):init(...)

end

function Object:destroy()

  return _ensemble:del(self)

end

function Object:exit()

  _ensemble:destroy()

end

function Object:update() end

function Object:draw() end

function Object:associate() end


----------------------------------------------------------------


Notice=setmetatable({},Object)

Notice.__index=Notice

function Notice:init(n)

  self.created=time()
  
  self.number=n

  return self

end

function Notice:span()

  return time()-self.created

end

function Notice:update()

  if(self:span()>3)then self:final() end

end

function Notice:draw()

  print("F L O O R   "..self.number,240-13*4,135-3,8)

end

function Notice:final()

  --Map:create():init()
  Map:stick()
  
  --GhostlyNewcomer:create(1):init()
  GhostlyNewcomer:stack()
  
  --assert(Player.create)
  
  --local c=Player
  --local c=getmetatable(Player)
  --local c=getmetatable(getmetatable(Player))
  --assert(c!=Ensemble)
  --assert(c!=Object)
  --assert(c!=Notice)
  --assert(c!=Enemy)
  --assert(c!=Player)
  --assert(c!=Map)
  --assert(c!=GhostlyNewcomer)
  --assert(c!=Ghost)
  --assert(c!=Newcomer)
  --assert(c!=Fighter)
  --assert(c!=Buff)
  --assert(c!=Shield)
  --assert(c!=Debugger)
  --assert(false)
  
  --CLEEEEEEEAN

  --assert(false)
  
  local p=Player:create(1)
  
  --assert(false)
  
  p:init()
  
  --assert(false)

  self:destroy()

end


----------------------------------------------------------------


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


----------------------------------------------------------------


Fighter=setmetatable({},Object)

Fighter.__index=Fighter

--Fighter.parent=getmetatable(Fighter)
--Fighter.parent=Object

function Fighter:create(...)

  local parent=getmetatable(getmetatable(self))
  
  return parent.create(self,...)

end

function Fighter:init(health,charge)

  --assert(false)

  --local parent=getmetatable(getmetatable(self))
  --local parent=self.parent
  local parent=Object

  if(not health)then health=5 end
  
  if(not charge)then charge=5 end

  self.health=health
  
  self.charge=charge
  
  --assert(false)
  
  --assert(parent!=Object,tostr(parent))

  return parent.init(self,health,charge) -- PROOOOOOOBLEM

end

function Fighter:update()

  if btnp(4) then
  
  elseif btnp(5) then
  
    Shield:create():init(self.x,self.y)
  
  end

end

function Fighter:draw()

end


----------------------------------------------------------------


Player=setmetatable({},Fighter)

Player.__index=Player

Player.parent=getmetatable(Player)

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

function Player:update()

end

function Player:draw()

  circ(240,135,12,8)

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


----------------------------------------------------------------


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


----------------------------------------------------------------


GhostlyNewcomer=setmetatable({},Object)

GhostlyNewcomer.__index=GhostlyNewcomer

function GhostlyNewcomer:update()

  --if(btnp(0) and rnd(100)<5)then Ghost:create(1):init(2) end
  if(btnp(0) and rnd(100)<5)then Ghost:stack(2) end

  --if(btnp(1) and rnd(100)<5)then Ghost:create(1):init(0) end
  if(btnp(1) and rnd(100)<5)then Ghost:stack(0) end

  --if(btnp(2) and rnd(100)<5)then Ghost:create(1):init(1) end
  if(btnp(2) and rnd(100)<5)then Ghost:stack(1) end

  --if(btnp(3) and rnd(100)<5)then Ghost:create(1):init(3) end
  if(btnp(3) and rnd(100)<5)then Ghost:stack(3) end
  
end


----------------------------------------------------------------


Ghost=setmetatable({},Object)

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

    if btn(0) or btn(1)
     or btn(2) or btn(3) then
   
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
  
  local x,y=240+cos(a)*r,135+sin(a)*r

  circ(x,y,12,8)

end


----------------------------------------------------------------


Newcomer=setmetatable({},Object)

Newcomer.__index=Newcomer

function Newcomer:update()

  if btnp(0) or btnp(1) or btnp(2) or btnp(3) then
  
    if(rnd(100)<5)then Enemy:create(1):init() end
  
  end

end


----------------------------------------------------------------


Buff=setmetatable({},Object)

Buff.__index=Buff

function Buff:init(x,y)

  if(not x)then x=240 end
  
  if(not y)then y=135 end

  self.create=time()
  
  self.lifespan=4
  
  self.x=x
  
  self.y=y

  return self

end

function Buff:span()

  return time()-self.create

end

function Buff:update()

  if(self:span()<self.lifespan)then self:destroy() end

end


----------------------------------------------------------------


Shield=setmetatable({},Buff)

Shield.__index=Shield

function Shield:draw()

  circ(self.x,self.y,7,32)

end


----------------------------------------------------------------

--[[

Debugger=setmetatable({},Object)

Debugger.__index=Debugger

function Debugger:init()

  _debugger=self

  return self

end

function Debugger:update()

end

function Debugger:draw()

end

function Debugger:classType(c)

  assert(c!=Ensemble)
  assert(c!=Object)
  assert(c!=Notice)
  assert(c!=Enemy)
  assert(c!=Player)
  assert(c!=Map)
  assert(c!=GhostlyNewcomer)
  assert(c!=Ghost)
  assert(c!=Newcomer)
  assert(c!=Shield)
  assert(c!=Buff)
  assert(c!=Fighter)
  assert(c!=Debugger)
  
end

--]]