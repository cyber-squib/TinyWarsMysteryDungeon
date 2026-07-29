playdate.display.setScale(2)
function getIndexInTable(value, tbl)
  for i, v in ipairs(tbl) do
    if v == value then
      return i
    end
  end
  return nil
end
function cls()
    playdate.graphics.clear()
    playdate.graphics.image.new("rsrc/screen.png"):draw(0,0)
end
function add(a,b)
    table.insert(a,b)
end
function del(a,b)
    --table.remove(a,b)
    table.remove(a,getIndexInTable(b, a))
end
function flr(x)
    return math.floor(x)
end
function spr(n,x,y,w,h,f,g)
    if w==nil then
        w=1
    end if h==nil then
        h=1
    end if x==nil then
        x=0
    end if y==nil then
        y=0
    end
    local i
    if f and g then
        i=playdate.graphics.kImageFlippedXY
    elseif f then
        i=playdate.graphics.kImageFlippedX
    elseif g then
        i=pplaydate.graphics.kImageFlippedY
    else
        i=playdate.graphics.kImageUnflipped
    end
    playdate.graphics.image.new("art/spritesheet.png"):draw(x,y,i,playdate.geometry.rect.new((n%16)*8,flr(n/16)*8,w*8,h*8))
end
function camera(x,y)
    playdate.graphics.setDrawOffset(x-36,y+4)
end
function btn(n)
    if n==0 then
        return playdate.buttonIsPressed(playdate.kButtonLeft)
    elseif n==1 then
        return playdate.buttonIsPressed(playdate.kButtonRight)
    elseif n==2 then
        return playdate.buttonIsPressed(playdate.kButtonUp)
    elseif n==3 then
        return playdate.buttonIsPressed(playdate.kButtonDown)
    elseif n==4 then
        return playdate.buttonIsPressed(playdate.kButtonA)
    elseif n==5 then
        return playdate.buttonIsPressed(playdate.kButtonB)
 end
end
function btnp(n)
    if n==0 then
        return playdate.buttonJustPressed(playdate.kButtonLeft)
    elseif n==1 then
        return playdate.buttonJustPressed(playdate.kButtonRight)
    elseif n==2 then
        return playdate.buttonJustPressed(playdate.kButtonUp)
    elseif n==3 then
        return playdate.buttonJustPressed(playdate.kButtonDown)
    elseif n==4 then
        return playdate.buttonJustPressed(playdate.kButtonA)
    elseif n==5 then
        return playdate.buttonJustPressed(playdate.kButtonB)
    end
end
function rect(x1,y1,x2,y2,c)
    local x,y,w,h=x1,y1,x2-x1,y2-y1
    local cl=playdate.graphics.getColor()
    local cc=playdate.graphics.kColorWhite
    if c==0 then
        cc=playdate.graphics.kColorBlack
 end
    playdate.graphics.setColor(cc)
    playdate.graphics.drawRect(x,y,w,h)
    playdate.graphics.setColor(cl)
end
function rectfill(x1,y1,x2,y2,c)
    local x,y,w,h=x1,y1,x2-x1,y2-y1
    local cl=playdate.graphics.getColor()
    local cc=playdate.graphics.kColorWhite
    if c==0 then
        cc=playdate.graphics.kColorBlack
    end
    playdate.graphics.setColor(cc)
    playdate.graphics.fillRect(x,y,w,h)
    playdate.graphics.setColor(cl)
end
function palt() end
function time()
    return playdate.getCurrentTimeMilliseconds()/1000
end
function sfx(n)
    playdate.sound.sample.new("art/soundeffect"..n..".wav"):play()
end
function circ(x,y,r,c)
    local cl=playdate.graphics.getColor()
    local cc=playdate.graphics.kColorWhite
    if c==0 then
        cc=playdate.graphics.kColorBlack
    end
    playdate.graphics.drawCircleAtPoint(x,y,r)
    playdate.graphics.setColor(cl)
end
function circfill(x,y,r,c)
    local cl=playdate.graphics.getColor()
    local cc=playdate.graphics.kColorWhite
    if c==0 then
        cc=playdate.graphics.kColorBlack
    end
    playdate.graphics.fillCircleAtPoint(x,y,r)
    playdate.graphics.setColor(cl)
end
function mget(x,y)
    return map[x+1][y+1]
end
function music() end
function abs(n)
    return math.abs(n)
end
function print(t, x, y, c)
    local cc=playdate.graphics.kColorWhite
    if c==0 then
        cc=playdate.graphics.kColorBlack
    end
    playdate.graphics.drawText(t, x, y, cc)
end
function sin(n)
    return math.sin(n)
end
function cos(n) 
    return math.cos(n)
end
function exclaim(t, x, y, cc)
    local cc=playdate.graphics.kColorWhite
    if c==0 then
        cc=playdate.graphics.kColorBlack
    end
    playdate.graphics.drawText(t, x, y, cc)
end
function tostr() return "" end
