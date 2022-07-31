arch nes.cpu

// Writing to this area willl expand to the rom of size 0x80000 (ignoring the header)
org 0x8000f
db 0x00

org 0x00004
db 0x20