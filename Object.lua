--[[pod_format="raw",created="2026-07-28 21:28:51",modified="2026-07-28 21:28:51",revision=0]]
Object={}

Object.__index=Object

function Object:init()

  return self

end

function Object:create(n)

  local o=setmetatable({},self)

  return _ensemble:add(o,n)

end

function Object:stick(...)

  self:create():init(...)

end

function Object:stack(...)

  self:create(1):init(...)

end

function Object:stock(...)

  self:create(flr(#_ensemble.objects/2)):init(...)

end

function Object:destroy()

  return _ensemble:del(self)

end

function Object:exit()

  _ensemble:destroy()

end

function Object:update() end

function Object:draw() end

function Object:associate() end