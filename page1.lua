local composer = require("composer")


local scene = composer.newScene()

function scene:create(event)

	local screenGroup = self.view

	local _table = {}
	local is_red = 1

	local array_X = 10
	local array_Y = 10

	local function changeColor( event )
		if ( event.phase == "ended" ) then
			for i=1, array_X*array_Y do
				if (
					(_table[i].location_X==event.target.location_X+0 and _table[i].location_Y==event.target.location_Y+0) or
					(_table[i].location_X==event.target.location_X+1 and _table[i].location_Y==event.target.location_Y+0) or
					(_table[i].location_X==event.target.location_X-1 and _table[i].location_Y==event.target.location_Y+0) or
					(_table[i].location_X==event.target.location_X+0 and _table[i].location_Y==event.target.location_Y+1) or
					(_table[i].location_X==event.target.location_X+0 and _table[i].location_Y==event.target.location_Y-1)
				) then
					if (_table[i].is_red~=1) then
						_table[i].is_red=1
					else
						_table[i].is_red=0
					end
				end
			end
			for i=1, array_X*array_Y do
				if (_table[i].is_red~=1) then
					_table[i]:setFillColor( 1, 1, 0 )
				else
					_table[i]:setFillColor( 1, 0, 0 )
				end
			end
		end
	  return true
	end

	for i=1, array_X do
		for j=1, array_Y do
			local circleObj = display.newCircle( 100, 100, 30 )
			circleObj.x = (_W/10)/2 + (i-1)*(_W/10)
			circleObj.y = (_H/10)/2 + (j-1)*(_H/10)
			circleObj.is_red = is_red
			circleObj.location_X = i
			circleObj.location_Y = j
			if (circleObj.is_red~=1) then
				circleObj:setFillColor( 1, 1, 0 )
			else
				circleObj:setFillColor( 1, 0, 0 )
			end
			circleObj:addEventListener( "touch", changeColor )
			screenGroup:insert(circleObj)
			table.insert(_table, circleObj)
		end
	end

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
