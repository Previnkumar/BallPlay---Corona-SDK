

function newTitleScreen()
	local self = display.newGroup()
	self.x = deviceWidth/2
	self.y = -320
	self.image = display.newImage("gameOver.png")
	self:insert(self.image)


	function self:addUI()
		self.restart = widget.newButton{
		x = 0,
		y = 80,
		height = 60,	
	 	id = "restart",
	    label = "Restart",
	    onRelease = restartButtonPress}	

	    self:insert(self.restart)

	    self.highScoreLabel = display.newText("Your Score",0,-30,native.systemFontBold,24)
	    self:insert(self.highScoreLabel)

	    self.highScore = display.newText(score,0,0,native.systemFontBold,24)
	    self:insert(self.highScore)
	end

	function self:removeScreen()
		for n=self.numChildren,1,-1 do 
			self[n]:removeSelf()
		end
	end

	transition.to(self,{y = 200, time = 1500, transition=easing.outBounce, onComplete = self.addUI})

	return self
end

function restartButtonPress(event)
	titleScreen:removeScreen()
	Bat:removeSelf()
	invisibleBat:removeSelf()
	BorderBottomRect:removeSelf()
	BorderTopRect:removeSelf()
	BorderLeftRect:removeSelf()
	BorderRightRect:removeSelf()
	ball:removeSelf()
	result:removeSelf()
	scoreText:removeSelf()
	startGame()
end