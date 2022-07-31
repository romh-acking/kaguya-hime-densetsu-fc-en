function menuCursor()
  state = emu.getState()

  --Draw some rectangles and print some text
  emu.drawRectangle(8, 8, 120, 78, 0x302060FF, true, 1)
  emu.drawRectangle(8, 8, 120, 78, 0x30FF4040, false, 1)
  emu.drawString(12, 12, "X: " ..  string.format('%02x', emu.read(0x203, emu.memType.cpu)), 0xFFFFFF, 0xFF000000, 5)
  emu.drawString(12, 20, "Y: " ..  string.format('%02x', emu.read(0x200, emu.memType.cpu)), 0xFFFFFF, 0xFF000000, 5)
  emu.drawString(12, 28, "X: " ..  string.format('%02x', emu.read(0x96, emu.memType.cpu)), 0xFFFFFF, 0xFF000000, 5)
  emu.drawString(12, 36, "Y: " ..  string.format('%02x', emu.read(0x97, emu.memType.cpu)), 0xFFFFFF, 0xFF000000, 5)

  emu.drawString(12, 44, "Limit X: " ..  string.format('%02x', emu.read(0x99, emu.memType.cpu)), 0xFFFFFF, 0xFF000000, 5)
  emu.drawString(12, 52, "Limit Y: " ..  string.format('%02x', emu.read(0x9a, emu.memType.cpu)), 0xFFFFFF, 0xFF000000, 5)
  
  emu.drawString(12, 60, "Column: " ..  string.format('%02x', emu.read(0x1E, emu.memType.cpu)), 0xFFFFFF, 0xFF000000, 5)
  
  
  local directionId = emu.read(0x38, emu.memType.cpu)
  local directionString = ""
  if directionId == 0  then
    directionString = "None"
  end
  
  if directionId == 1  then
    directionString = "Right"
  end
  
  if directionId == 2  then
    directionString = "Left"
  end
  
  if directionId == 8  then
    directionString = "Up"
  end 
  
  if directionId == 4  then
    directionString = "Down"
  end
  
  emu.drawString(12, 68, "Direction: " ..  string.format('%02x', directionId) .. " " ..  directionString, 0xFFFFFF, 0xFF000000, 5)

  
end

emu.addEventCallback(menuCursor, emu.eventType.endFrame)
