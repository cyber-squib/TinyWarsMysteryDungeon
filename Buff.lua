--[[pod_format="raw",created="2026-07-28 21:21:39",modified="2026-07-28 21:21:39",revision=0]]
Buff=_G.setmetatable({},Object)

Buff.__index=Buff

function Buff:init(x,y)

  if(not x)then x=240 end
  
  if(not y)then y=135 end

  self.create=_G.time()
  
  self.lifespan=2
  
  self.x=x
  
  self.y=y

  return self

end

function Buff:span()

  return _G.time()-self.create

end

function Buff:update()

  if(self:span()>self.lifespan)then self:destroy() end

end

