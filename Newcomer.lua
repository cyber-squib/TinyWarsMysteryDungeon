--[[pod_format="raw",created="2026-07-28 21:22:13",modified="2026-07-28 21:22:15",revision=1]]

Newcomer=setmetatable({},Object)

Newcomer.__index=Newcomer

function Newcomer:update()

  if btnp(0) or btnp(1) or btnp(2) or btnp(3) then
  
    if(rnd(100)<5)then Enemy:create(1):init() end
  
  end

end
