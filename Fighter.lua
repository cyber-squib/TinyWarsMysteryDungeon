--[[pod_format="raw",created="2026-07-28 21:27:14",modified="2026-07-28 21:27:14",revision=0]]
Fighter=_G.setmetatable({},Object)

Fighter.__index=Fighter

function Fighter:init(health,zeal,cost)

  local parent=Object

  if not health then health=5 end
  
  if not zeal then zeal=1 end
  
  if not cost then cost=1 end

  self.health=health
  
  self.charge=0
  
  self.zeal=zeal
  
  self.cost=cost

  return parent.init(self,health,charge)

end

function Fighter:update()

  if self.charge>=self.cost then
    
    --_G.assert(false)
  
    if _G.btnp(0) then
  
      self.charge-=self.cost
    
      Shot:stock(self.x,self.y,-1,0)
    
    elseif _G.btnp(1) then
  
      self.charge-=self.cost
    
      Shot:stock(self.x,self.y,1,0)

    elseif _G.btnp(2) then
  
      self.charge-=self.cost
    
      Shot:stock(self.x,self.y,0,-1)

    elseif _G.btnp(3) then
  
      self.charge-=self.cost
    
      Shot:stock(self.x,self.y,0,1)
  
    end
    
  end

  if _G.btnp(4) then
  
    self.charge+=self.zeal
  
    Charge:stack(self.x,self.y)
  
  elseif _G.btnp(5) then
    
    Shield:stack(self.x,self.y)
  
  end
  
end

function Fighter:draw()

end