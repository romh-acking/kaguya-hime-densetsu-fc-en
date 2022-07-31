-- Only works when PC @ DD1F

while true do
gui.text(20, 10, "Points Earned: ")
gui.text(20, 20, string.format("%x", memory.readbyte(0x4EB)))

gui.text(20, 30, "Score: ")

gui.text(20, 40, memory.readbyte(0x4EC))
gui.text(30, 40, memory.readbyte(0x4ED))
gui.text(40, 40, memory.readbyte(0x4EE))
gui.text(50, 40, memory.readbyte(0x4EF))
gui.text(60, 40, memory.readbyte(0x4f0))
gui.text(70, 40, memory.readbyte(0x4f1))

emu.frameadvance()
end