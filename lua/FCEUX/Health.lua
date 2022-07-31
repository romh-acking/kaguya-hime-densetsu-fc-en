while true do
gui.text(20, 10, "Health: #1" .. string.format("%d", memory.readbyte(0x04EA)))

emu.frameadvance()
end