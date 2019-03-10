local composer = require("composer")


local scene = composer.newScene()

function scene:create(event)

	local screenGroup = self.view

  local leftBtn = display.newRect( 0, 0, _W/4, _H/10 )
	local leftBtnX = _W/3
	local leftBtnY = (_H/4)*3.5
	leftBtn.x = leftBtnX
	leftBtn.y = leftBtnY
	leftBtn:setFillColor( 1, 1, 1 )
	screenGroup:insert(leftBtn)
	local startText = display.newText( "<-", leftBtnX, leftBtnY , native.systemFont, _W*1/10 )
	startText:setFillColor( 0, 0, 0 )
	screenGroup:insert(startText)

  local rightBtn = display.newRect( 0, 0, _W/4, _H/10 )
  local rightBtnX = _W-_W/3
	local rightBtnY = (_H/4)*3.5
	rightBtn.x = rightBtnX
	rightBtn.y = rightBtnY
	rightBtn:setFillColor( 1, 1, 1 )
	screenGroup:insert(rightBtn)
	local startText = display.newText( "->", rightBtnX, rightBtnY , native.systemFont, _W*1/10 )
	startText:setFillColor( 0, 0, 0 )
	screenGroup:insert(startText)

  local lenPlan = _W/4
  local plan = display.newRect( 0, 0, lenPlan, _H/100 )
  local planMaxX = _W-_W/8
  local planMinX = _W/8
  local planX = (_W-_W/4)*math.random()+_W/8
	local planY = (_H/4)*3
	plan.x = planX
	plan.y = planY
	plan:setFillColor( 1, 1, 1 )
	screenGroup:insert(plan)

  r = _W/20
  local ball = display.newCircle( 0, 0, r )
  ball.x = math.random()*(_W-_W*2/20)+_W/20
	ball.y = _H*1/10
  screenGroup:insert(ball)

  local lefting=0
  local function planMoveLeft( event )
	    if ( event.phase == "began" ) then
          lefting=1
	    elseif ( event.phase == "ended" ) then
          lefting=0
	    end
	    return true
	end
  leftBtn:addEventListener( "touch", planMoveLeft )

  local function planMoveRight( event )
	    if ( event.phase == "began" ) then
          lefting=-1
	    elseif ( event.phase == "ended" ) then
          lefting=0
	    end
	    return true
	end
  rightBtn:addEventListener( "touch", planMoveRight )

  local function onComplete( event )
    if ( event.action == "clicked" ) then
        local i = event.index
        if ( i == 1 ) then
          composer.gotoScene( "page1" )
        end
    end
  end

  local finishStatus = 0
  planMove=function( event )
    if finishStatus==0 then
      if lefting==1 then
        planX = planX-_W/50
      elseif lefting==-1 then
        planX = planX+_W/50
      end
      if planX>planMaxX or planX<planMinX then
        planX = plan.x
      end
      plan.x = planX
      
      ball.y = ball.y+_H/100
      if ball.y>=(planY+_H/50) then
        finishStatus=1
        local alert = native.showAlert( "Fail", "Fail", { "OK" }, onComplete)
      elseif ball.y>=planY and (ball.x>=plan.x-lenPlan/2 and ball.x<=plan.x+lenPlan/2) then
        finishStatus=1
        local alert = native.showAlert( "Win", "Win", { "OK" }, onComplete)
      end
    end
  end

  Runtime:addEventListener( "enterFrame", planMove )
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
