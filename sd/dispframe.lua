----------------------------------------------------------------------
-- ezLCD Display Frame test application note example
--
-- Created  01/11/2024 -  Jacob Christ
--
----------------------------------------------------------------------

function Render_Title()
	ez.Cls(ez.RGB(0, 0, 0))
	ez.BoxFill(0, 0, ez.Width, 40, ez.RGB(64,64,64)) -- X1, Y1, X2, Y2, Color
	ez.SetFtFont(1,18,18)
	ez.SetColor(ez.RGB(255,255,255))
	ez.SetXY(0,9)
	print(string.format("   EarthLCD Display Frames"))
end

function MainFunction()
	local use_frames = 1
	if use_frames == 1 then
		ez.SetDrawFrame(1)
		ez.SetDispFrame(2, 1)

		Render_Title()

		ez.SetDrawFrame(2)
		ez.SetDispFrame(1, 1)
	end

	Render_Title()

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

		if use_frames == 1 then
			if frame == 1 then
				ez.SetDrawFrame(1)
				ez.SetDispFrame(2, 1)
				frame = 2
			else
				ez.SetDrawFrame(2)
				ez.SetDispFrame(1, 1)
				frame = 1
			end
		end

		x = x + xdir
		y = y + ydir
		if (x + size) >= ez.Width or x <= 0 then
			xdir = xdir * -1
		end
		if (y + size) >= ez.Height or y <= 0 then
			ydir = ydir * -1
		end

		ez.Cls(ez.RGB(0, 0, 0)) -- erase the whole screen beforfe we start drawing

		-- ez.BoxFill(0,40, 320,60, ez.RGB(0, 0, 0)) -- X1, Y1, X2, Y2, Color  **** UNCOMMENT OUT THIS LINE TO BREAK PROGRAM ****
		ez.SetXY(0,40)
		ez.SetColor(ez.RGB(255,255,0))
		-- print(string.format("x=%03d y=%03d", x, y))
		print(string.format("%d x1=%03d y1=%03d x2=%03d y2=%03d", frame, x1, y1, x2, y2))

		-- -- Erase Box
		-- ez.BoxFill(x1,y1, x2,y2, ez.RGB(255, 0, 0)) -- X1, Y1, X2, Y2, Color  **** UNCOMMENT OUT THIS LINE TO BREAK PROGRAM ****
		x1 = x
		x2 = x+size
		y1 = y
		y2 = y+size
		-- Draw Box
		-- ez.BoxFill(x1-1,y1-1, x2+1,y2+1, ez.RGB(0, 0, 0)) -- X1, Y1, X2, Y2, Color
		ez.BoxFill(x1,y1, x2,y2, ez.RGB(255, 255, 255)) -- X1, Y1, X2, Y2, Color


		-- ez.Wait_ms(10)
	end

end

function ErrorHandler(errmsg)
    print(debug.traceback())
    print(errmsg)
end

-- Call mainFunction() protected by errorHandler
rc, err = xpcall(function() MainFunction() end, ErrorHandler)
