--[[pod_format="raw",created="2026-07-28 21:19:28",modified="2026-07-28 21:19:28",revision=0]]
Frame=_G.setmetatable({},Object)

Frame.__index=Frame

function Frame:draw()
  
  local w=3+24*0
  
  local h=3+24*1
  
  _G._G.rectfill(240-135+w,0+h,240+135-w-1,270-h-1,2^35)
  
  _G.rect(240-135+w,0+h,240+135-w-1,270-h-1,7)

end