﻿function sceneInfo()
  state = emu.getState()

  --Draw some rectangles and print some text
  emu.drawRectangle(8, 8, 120, 40, 0x302060FF, true, 1)
  emu.drawRectangle(8, 8, 120, 40, 0x30FF4040, false, 1)
  emu.drawString(12, 12, "Top cursor X: " ..  string.format('%02x', emu.read(0x5B4, emu.memType.cpu)), 0xFFFFFF, 0xFF000000, 5)

  
end

emu.addEventCallback(sceneInfo, emu.eventType.endFrame)
