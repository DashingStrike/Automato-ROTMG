--
-- Repeatedly click a single location, avoid shift-click, stop if pixel changes
--

dofile("common.inc");

askText = singleLine([[
  Clicker --
  Move mouse to a spot you want clicked and press shift.
]]);

function doit()
  local mousePos = askForWindow(askText);

  local clickCount = 0;
  local shift_held = 4;
  local px = srReadPixel(mousePos[0], mousePos[1]);
  local move_counter = 0;
	
  while 1 do
    local color = 0xffffffff;
    local new_px = srReadPixel(mousePos[0], mousePos[1]);
	if not (new_px == px) then
		error 'pixel changed';
	end
	if lsShiftHeld() then
		shift_held = 4;
	end
	if (shift_held > 0) then
		shift_held = shift_held - 1;
	else
		srClickMouseNoMove(mousePos[0], mousePos[1]);
        clickCount = clickCount + 1;
	end

	local message = clickCount .. " clicks so far. ";

	move_counter = move_counter + 1;
	if move_counter == 10 then
		message = message .. " Moving.";
		srKeyEvent('a');
	elseif move_counter == 20 then
		message = message .. " Moving.";
		srKeyEvent('d');
	elseif move_counter == 30 then
		message = message .. " Moving.";
		srKeyEvent('d');
	elseif move_counter == 40 then
		message = message .. " Moving.";
		srKeyEvent('d');
		move_counter = 0;
	end
		
    sleepWithStatusPause(50, message, color);
  end
end
