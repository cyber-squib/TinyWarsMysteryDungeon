--[[pod_format="raw",created="2026-07-28 21:20:51",modified="2026-07-28 21:20:51",revision=0]]
Charge=setmetatable({},Buff)

Charge.__index=Charge

function Charge:draw()

  for i=1,8 do
  
    local s=40
  
    local x,y=self.x+rnd(s)-s/2,self.y+rnd(s)-s/2
    
    local h=3
    
    line(x,y-h,x,y+h,7)
  
  end

end
