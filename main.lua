--_debug=true

function _final()

  _ensemble:destroy()
  
  _num+=1
  
  --Ensemble.objects={}

end

_num=1

function _init()

  _G.vid()
  
  _G.palt(0,false)
  
  --Ensemble:init():create()
  Ensemble:init():create()
  
  --Debugger:init():create()
  
  --Notice:init(_num):create()
  Notice:stick(_num)

end

include"Ensemble.lua"

include"Object.lua"

include"Notice.lua"

include"Enemy.lua"

include"Fighter.lua"

include"Player.lua"

include"Map.lua"

include"GhostlyNewcomer.lua"

include"Ghost.lua"

include"Newcomer.lua"

include"Buff.lua"

include"Shield.lua"

include"Charge.lua"

include"Shot.lua"

include"Frame.lua"