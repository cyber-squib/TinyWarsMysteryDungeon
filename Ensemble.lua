--[[pod_format="raw",created="2026-07-28 21:29:21",modified="2026-07-28 21:29:21",revision=0]]
Ensemble={}

Ensemble.__index=Ensemble

function Ensemble:init()

  self.objects={}
  
  return self

end

function Ensemble:create()

  _ensemble=_G.setmetatable({},self)
  
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

  _G.cls()

  for i=#self.objects,1,-1 do
  
    local o=self.objects[i]
    
    if(o and o.draw)then o:draw() end
  
  end

end

function Ensemble:add(o,n)
  
  return _G.add(self.objects,o,n)

end

function Ensemble:del(o)

  return _G.del(self.objects,o)

end

function Ensemble:destroy()

  local o=self.objects[#self.objects]
  
  local t=_G.getmetatable(o)
  
  _G.assert(t==Map)
  
  o:destroy()
  
  --_G.assert(false,"FIX THIS SHIT!")

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