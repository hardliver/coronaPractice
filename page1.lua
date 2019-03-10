local composer = require("composer")


local scene = composer.newScene()

function scene:create(event)

	local screenGroup = self.view

	local function pressButton( event )
	    if ( event.phase == "began" ) then
	        print( "Touch event began on: " )
	    elseif ( event.phase == "ended" ) then
	        print( "Touch event ended on: " )
					composer.gotoScene("page2")
	    end
	    return true
	end

	local startBtn = display.newRect( 0, 0, _W/2, _H/10 )
	local btnX = _W/2
	local btnY = (_H/4)*3.5
	startBtn.x = btnX
	startBtn.y = btnY
	startBtn:setFillColor( 1, 1, 1 )
	screenGroup:insert(startBtn)
	local startText = display.newText( "START!", btnX, btnY , native.systemFont, _W*1/10 )
	startText:setFillColor( 0, 0, 0 )
	screenGroup:insert(startText)

	startBtn:addEventListener( "touch", pressButton )

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
