----------------------------------------------------------------------
-- ezLCD Display Frame test application note example
--
-- Created  01/11/2024 -  Jacob Christ
--
----------------------------------------------------------------------

function Render_Title()
	ez.Cls(ez.RGB(0, 0, 0))
	ez.BoxFill(0, 0, ez.Width, 40, ez.RGB(64,64,64)) -- X1, Y1, X2, Y2, Color
	ez.SetFtFont(6,18,18)
	ez.SetColor(ez.RGB(255,255,255))
	ez.SetXY(0,9)
	print(string.format("   EarthLCD Display Frames"))
end

function MainFunction()
	local use_frames = 0
	-- if use_frames == 1 then
	-- 	ez.SetDrawFrame(1)
	-- 	ez.SetDispFrame(2, 1)

	-- 	Render_Title()

	-- 	ez.SetDrawFrame(2)
	-- 	ez.SetDispFrame(1, 1)
	-- end

	Render_Title()

	-- print(string.format("%d %d %d %d %d ", ez.GetDispFrame(0), ez.GetDispFrame(1), ez.GetLayerVisibility(0), ez.GetLayerVisibility(1), ez.GetDrawFrame(), ez.GetNoOfFrames()))
	-- print(string.format("%d %d  ", ez.GetDrawFrame(), ez.GetNoOfFrames()))
	--print(string.format("%d %d ", ez.GetDispFrame(0), ez.GetDispFrame(1)))

	local frame = 1;
	local size = 10
	local x = ez.Width / 2
	local y = ez.Height / 2
	local xdir = 1
	local ydir = 1
	
	local x1 = x
	local x2 = size
	local y1 = y
	local y2 = size
	while (1) do

		-- if use_frames == 1 then
		-- 	if frame == 1 then
		-- 		ez.SetDrawFrame(1)
		-- 		ez.SetDispFrame(2, 1)
		-- 		frame = 2
		-- 	else
		-- 		ez.SetDrawFrame(2)
		-- 		ez.SetDispFrame(1, 1)
		-- 		frame = 1
		-- 	end
		-- end

		x = x + xdir
		y = y + ydir
		if (x + size) >= ez.Width or x <= 0 then
			xdir = xdir * -1
		end
		if (y + size) >= ez.Height or y <= 0 then
			ydir = ydir * -1
		end

		-- -- Erase Box
		-- ez.BoxFill(x1,y1, x2,y2, ez.RGB(30, 30, 30)) -- X1, Y1, X2, Y2, Color
		x1 = x
		x2 = x+size
		y1 = y
		y2 = y+size
		-- Draw Box
		ez.BoxFill(x1,y1, x2,y2, ez.RGB(255, 255, 255)) -- X1, Y1, X2, Y2, Color

		ez.BoxFill(0,40, 150,60, ez.RGB(0, 0, 0)) -- X1, Y1, X2, Y2, Color
		ez.SetXY(0,40)
		ez.SetColor(ez.RGB(255,255,0))
		print(string.format("x=%03d y=%03d", x, y))

		ez.Wait_ms(100)
	end

end

function ErrorHandler(errmsg)
    print(debug.traceback())
    print(errmsg)
end

-- Call mainFunction() protected by errorHandler
rc, err = xpcall(function() MainFunction() end, ErrorHandler)
