--[[pod_format="raw",created="2026-07-28 21:21:13",modified="2026-07-28 21:21:13",revision=0]]
Shield=setmetatable({},Buff)

Shield.__index=Shield

function Shield:draw()

  local m=sin(time()*4)*3

  circ(self.x,self.y,18+m,7)

end
