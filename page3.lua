local composer = require("composer")


local scene = composer.newScene()

function scene:create(event)

	local screenGroup = self.view

  local score = 0
  local scoreboard = display.newRect( 0, 0, _W/2, _H/10 )
  local scoreboardX = _W/2
  local scoreboardY = (_H/10)
  scoreboard.x = scoreboardX
  scoreboard.y = scoreboardY
  scoreboard:setFillColor( 1, 1, 1 )
  screenGroup:insert(scoreboard)
  local scoreboardText = display.newText( score, scoreboardX, scoreboardY , native.systemFont, _W*1/10 )
  scoreboardText:setFillColor( 0, 0, 0 )
  screenGroup:insert(scoreboardText)

  local createBallBtn = display.newRect( 0, 0, _W/2, _H/10 )
  local createBallBtnX = _W/2
  local createBallBtnY = _H-(_H/10)
  createBallBtn.x = createBallBtnX
  createBallBtn.y = createBallBtnY
  createBallBtn:setFillColor( 1, 1, 1 )
  screenGroup:insert(createBallBtn)
  local scoreBtnText = display.newText( 'Create Ball', createBallBtnX, createBallBtnY , native.systemFont, _W*1/10 )
  scoreBtnText:setFillColor( 0, 0, 0 )
  screenGroup:insert(scoreBtnText)

  ballGroup = {}
  local function _createBall()
    r = _W/20
    local ball = display.newCircle( 0, 0, r )
    ball.x = math.random()*_W
  	ball.y = math.random()*_H
    ball:setFillColor( math.random(), math.random(), math.random() )
    screenGroup:insert(ball)
    table.insert(ballGroup, ball)

    local function removeBall( obj )
      ball:removeSelf()
      table.remove(ballGroup,1)
    end
    transition.to( ball, { time=5*1000, alpha=0, y=ball.y+_H*1/10, onComplete=removeBall } )
  end

  local function createBall( event )
	    if ( event.phase == "began" ) then
	    elseif ( event.phase == "ended" ) then
        _createBall()
	    end
	    return true
	end
  createBallBtn:addEventListener( "touch", createBall )

  local function ballCounter( event )
    score = #ballGroup
    scoreboardText.text = score
    scoreboard:toFront()
    scoreboardText:toFront()
    createBallBtn:toFront()
    scoreBtnText:toFront()
	end

  Runtime:addEventListener( "enterFrame", ballCounter )

end

function scene:show( event )
	if ( event.phase == "did" ) then
	end
end

function scene:hide( event )
	if ( event.phase == "did" ) then
    Runtime:removeEventListener( "enterFrame", planMove )
		composer.removeScene( "page2" )
	end
end

scene:addEventListener("create",scene)
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )

return scene
