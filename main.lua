-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here


widget = require("widget")
widget.setTheme( "widget_theme_android" )

score = 0
Foreground = nil

require("Foreground")
require("titleScreen")

function startGame()
	score = 0
	Foreground = newForeground()
	
	Bat.collision = OnBatHit
	Bat:addEventListener("collision")

	BorderBottomRect.collision = onRedLineHit
	BorderBottomRect:addEventListener("collision")

	invisibleBat:addEventListener("touch", onBatTouch)
end

function OnBatHit(event)
	score = score+5
	result.text = score
end

function onBatTouch(event)
	if(event.x>30 and event.x<deviceWidth-30) then
		transition.to(Bat,{x=event.x,time = 50})
	end
end

function onRedLineHit(event)
	physics.pause()
	titleScreen = newTitleScreen()
end

startGame()

