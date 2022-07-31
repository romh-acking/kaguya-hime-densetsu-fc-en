-- Only works when PC @ DD1F

while true do
gui.text(20, 10, "Menu Cursor: ")
gui.text(20, 20, "X: " .. string.format("%x", memory.readbyte(0x203)))
gui.text(20, 30, "Y: " .. string.format("%x", memory.readbyte(0x200)))

gui.text(20, 50, "X: " .. string.format("%x", memory.readbyte(0x96)))
gui.text(20, 60, "Y: " .. string.format("%x", memory.readbyte(0x97)))

gui.text(20, 100, "Limit")

gui.text(20, 110, "X: " .. string.format("%x", memory.readbyte(0x99)))
gui.text(20, 120, "Y: " .. string.format("%x", memory.readbyte(0x9a)))



gui.text(20, 140, "Option Selected " .. string.format("%x", memory.readbyte(0x1E)))


emu.frameadvance()
end