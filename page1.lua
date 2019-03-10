local composer = require("composer")


local scene = composer.newScene()

function scene:create(event)

	local screenGroup = self.view

	local function catchBall( event )
	    if ( event.phase == "began" ) then
        print( "Touch event began on: " )
	    elseif ( event.phase == "ended" ) then
        print( "Touch event ended on: " )
				composer.gotoScene("page2")
	    end
	    return true
	end

	local catchBallBtn = display.newRect( 0, 0, _W/2, _H/10 )
	local btnX = _W/2
	local btnY = (_H/4)*3
	catchBallBtn.x = btnX
	catchBallBtn.y = btnY
	catchBallBtn:setFillColor( 1, 1, 1 )
	screenGroup:insert(catchBallBtn)
	local startText = display.newText( "Catch Ball", btnX, btnY , native.systemFont, _W*1/10 )
	startText:setFillColor( 0, 0, 0 )
	screenGroup:insert(startText)

	catchBallBtn:addEventListener( "touch", catchBall )

	local function createBall( event )
	    if ( event.phase == "began" ) then
        print( "Touch event began on: " )
	    elseif ( event.phase == "ended" ) then
        print( "Touch event ended on: " )
				composer.gotoScene("page3")
	    end
	    return true
	end

	local createBallBtn = display.newRect( 0, 0, _W/2, _H/10 )
	local btnX = _W/2
	local btnY = (_H/4)*3.5
	createBallBtn.x = btnX
	createBallBtn.y = btnY
	createBallBtn:setFillColor( 1, 1, 1 )
	screenGroup:insert(createBallBtn)
	local startText = display.newText( "Create Ball", btnX, btnY , native.systemFont, _W*1/10 )
	startText:setFillColor( 0, 0, 0 )
	screenGroup:insert(startText)

	createBallBtn:addEventListener( "touch", createBall )
end

function scene:show( event )
	if ( event.phase == "did" ) then
	end
end

function scene:hide( event )
	if ( event.phase == "did" ) then
		composer.removeScene( "page1" )
	end
end

scene:addEventListener("create",scene)
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )

return scene
