--[[pod_format="raw",created="2026-07-28 21:22:13",modified="2026-07-28 21:22:15",revision=1]]

Newcomer=_G.setmetatable({},Object)

Newcomer.__index=Newcomer

function Newcomer:update()

  if _G.btnp(0) or _G.btnp(1) or _G.btnp(2) or _G.btnp(3) then
  
    if(_G.rnd(100)<5)then Enemy:create(1):init() end
  
  end

end
