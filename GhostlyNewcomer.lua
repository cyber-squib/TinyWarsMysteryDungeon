--[[pod_format="raw",created="2026-07-28 21:24:03",modified="2026-07-28 21:24:03",revision=0]]
GhostlyNewcomer=_G.setmetatable({},Object)

GhostlyNewcomer.__index=GhostlyNewcomer

function GhostlyNewcomer:update()

  --if(_G.btnp(0) and _G.rnd(100)<5)then Ghost:create(1):init(2) end
  if(_G.btnp(0) and _G.rnd(100)<5)then Ghost:stock(2) end

  --if(_G.btnp(1) and _G.rnd(100)<5)then Ghost:create(1):init(0) end
  if(_G.btnp(1) and _G.rnd(100)<5)then Ghost:stock(0) end

  --if(_G.btnp(2) and _G.rnd(100)<5)then Ghost:create(1):init(1) end
  if(_G.btnp(2) and _G.rnd(100)<5)then Ghost:stock(1) end

  --if(_G.btnp(3) and _G.rnd(100)<5)then Ghost:create(1):init(3) end
  if(_G.btnp(3) and _G.rnd(100)<5)then Ghost:stock(3) end
  
end