-- Only works when PC @ DD1F

while true do

local Scene = memory.readword(0x8e)

gui.text(20, 20, "RAM Location of line ID: " .. string.format("%x", Scene ))
gui.text(20, 30, "Line ID: " .. string.format("%x", memory.readbyte(Scene)))
emu.frameadvance()
end