--
-- Repeatedly click a single location
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
	
  while 1 do
    local color = 0xffffffff;
	if lsShiftHeld() then
		shift_held = 4;
	end
	if (shift_held > 0) then
		shift_held = shift_held - 1;
	else
		safeClick(mousePos[0], mousePos[1]);
        clickCount = clickCount + 1;
	end

    sleepWithStatusPause(150, clickCount .. " clicks so far. ", color);
  end
end
