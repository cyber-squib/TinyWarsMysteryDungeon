--[[pod_format="raw",created="2026-07-28 21:20:51",modified="2026-07-28 21:20:51",revision=0]]
Charge=_G.setmetatable({},Buff)

Charge.__index=Charge

function Charge:draw()

  for i=1,8 do
  
    local s=40
  
    local x,y=self.x+_G.rnd(s)-s/2,self.y+_G.rnd(s)-s/2
    
    local h=3
    
    _G.line(x,y-h,x,y+h,7)
  
  end

end
