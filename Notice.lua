--[[pod_format="raw",created="2026-07-28 21:28:19",modified="2026-07-28 21:28:19",revision=0]]
Notice=_G.setmetatable({},Object)

Notice.__index=Notice

function Notice:init(n)

  self.created=_G.time()
  
  self.number=n

  return self

end

function Notice:span()

  return _G.time()-self.created

end

function Notice:update()

  if(self:span()>3)then self:final() end

end

function Notice:draw()

  _G.print("F L O O R   "..self.number,240-13*4,135-3,8)

end

function Notice:final()

  Map:stick()
  
  GhostlyNewcomer:stack()
  
  Frame:stack()
  
  Player:stack()

  self:destroy()

end