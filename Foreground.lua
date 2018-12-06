

function newForeground()
	physics = require("physics")
	physics.start()
	physics.setGravity(0,50)

	deviceWidth = display.actualContentWidth
	deviceHeight = display.actualContentHeight

	----invisible layer to facilitate touch 
	invisibleBat = display.newRect(deviceWidth/2,deviceHeight-150,deviceWidth,150)

	--setting border frame to screen
	BorderBottomRect = display.newRect(display.contentCenterX,display.screenOriginY+deviceHeight-5,deviceWidth,10)
	BorderTopRect = display.newRect(display.contentCenterX,display.screenOriginY+5,deviceWidth,10)
	BorderLeftRect = display.newRect(display.screenOriginX+5,display.contentCenterY,10,deviceHeight)
	BorderRightRect = display.newRect(display.screenOriginX+deviceWidth-5,display.contentCenterY,10,deviceHeight)

	--score card on top
	scoreText = display.newText( "SCORE :", 125, 0, native.systemFont, 24 )
	result = display.newText( "0", 200, 0, native.systemFont, 24 )


	-- ball to bounce
	ball = display.newCircle(math.random(110,130),75,20)

	--player 
	Bat = display.newRect(deviceWidth/2, deviceHeight-120, deviceWidth/5, 10)

	--setting colors
	invisibleBat:setFillColor(0,0,0)

	BorderBottomRect:setFillColor(1,0,0)
	BorderTopRect:setFillColor(0,1,0)
	BorderLeftRect:setFillColor(0,1,0)
	BorderRightRect:setFillColor(0,1,0)

	ball:setFillColor(0.4,0.9,0.9)

	--add objects to physics
	physics.addBody(BorderBottomRect,"static")
	physics.addBody(BorderTopRect,"static")
	physics.addBody(BorderLeftRect,"static")
	physics.addBody(BorderRightRect,"static")
	physics.addBody(Bat, "static", {density=10})
	physics.addBody(ball,{bounce=1,radius=20, density=1})

end