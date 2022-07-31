arch nes.cpu

// Load metatiles
// DA3D  $B1 $89      LDA ($89),Y @ $8629             A:0B X:DD Y:11 P:05 SP:3B CYC:106 SL:28

org $000010
incbin "asm/gfx/Font 8x8 2BPP.bin"

org $017350
incbin "asm/gfx/Title Screen 2BPP.bin"

org $039900
incbin "asm/gfx/Title Screen Title Map.bin"

org $b790
incbin "asm/gfx/Energy Drink.bin"

org $132f0
incbin "asm/gfx/Mt Lozz Ent.bin"

// お化けやしき (お化け屋敷)
org $1cf90
incbin "asm/gfx/Carnival.bin"

org $13660
incbin "asm/gfx/Mt Lozz Stores.bin"

// 受付
// Reception
org $04010
//incbin "asm/gfx/Phone Club Reception.bin"

org $12f00
incbin "asm/gfx/School.bin"

org $09a70
incbin "asm/gfx/Sea Entrance.bin"

// The game uses generic metatiles with ids like C0 C1 C2 C3
// that are reused a lot. So we have to work around this.
org $092f0
incbin "asm/gfx/Dragon Sign.bin"
org $24AB9
db $FE
org $24ABE
db $CD

org $1C910
incbin "asm/gfx/Bar.bin"
org $25711
db $FE,$C4,$C5,$FE,$C3

org $16f10
incbin "asm/gfx/Sign.bin"

org $15d50
incbin "asm/gfx/Coupon Icon.bin"

org $26e0
//incbin "asm/gfx/Temple Entrance.bin"

//==============================
// Grave
//==============================
table "asm/tbl/CHR - Trans.tbl"
org $24ED8
db "He"
db "li"

db "re"
db "es"

// Move name down
org $3e1b7
lda #$09

// Blank out bottom text
org $24EE8
db $FF,$FF
db $9a,$9a

db $FF,$FF
db $9a,$9b

db $FF,$FF

org $c760
incbin "asm/gfx/Grave.bin"

//==============================
// Coupon
//==============================

org $C2C0
incbin "asm/gfx/Coupon.bin"
org $142C0
incbin "asm/gfx/Coupon.bin"

org $24E2C
table "asm/tbl/Coupon.tbl"
db $FF,$A4,$FF,$A5
db $A4,$A4,$A6,"F"
db $A4,$A4,"r","e"
db $A4,$A4,"e"," "
db $A4,$A4,"T","r"
db $A4,$A4,"i","a"
db $A4,$A4,"l",$AB
db $A4,$FF,$AC,$FF
db $FF,$A6,$FF,$A6
db $FD,$AD,"T","h"
db $AD,$AD,"e"," "
db $AD,$AD,"o","w"
db $AD,$AD,"n","e"
db $AD,$AD,"r"," "
db $AD,$FD,"o","f"
db $AB,$FF,$AB,$FF
db " ","c"," ","a"
db "o","u"," ","f"
db "n"," ","e"," "
db "s","e",$B5,"P"
db "n","."," ","C"
db " "," ","l","u"
db " "," ","b",$BA
db $FF,$A5,$FF,$BB
db $A6,$A6,$BB,$BB
db "F","u",$BB,$BB
db "n","!",$BB,$BB
db $AC,$FF,$BB,$FF

// Sprites
org $227FB; base $227EB
table "asm/tbl/Coupon - Sprite.tbl"

// xxxxxxx,$AA,xxx,$AA,xxx,$AA,xxx,$AA,xxx

db $04,$01,$FF,$00,$3F,$00,$FF,$00,$40,$00
db $04,$01,$3F,$00,$3F,$00,$41,$00,"F",$00
db $04,$01,$3F,$00,$3F,$00,"r",$00,"e",$00
db $04,$01,$3F,$00,$3F,$00,"e",$00," ",$00
db $04,$01,$3F,$00,$3F,$00,"T",$00,"r",$00
db $04,$01,$3F,$00,$3F,$00,"i",$00,"a",$00
db $04,$01,$3F,$00,$3F,$00,"l",$00,$46,$00
db $04,$01,$3F,$00,$FF,$00,$47,$00,$FF,$00
db $04,$01,$FF,$00,$41,$00,$FF,$00,$41,$00
db $04,$01," ",$00,$48,$00,"T",$00,"h",$00
db $04,$01,$48,$00,$48,$00,"e",$00," ",$00
db $04,$01,$48,$00,$48,$00,"o",$00,"w",$00
db $04,$01,$48,$00,$48,$00,"n",$00,"e",$00
db $04,$01,$48,$00,$48,$00,"r",$00," ",$00
db $04,$01,$48,$00," ",$00,"o",$00,"f",$00
db $04,$01,$46,$00,$FF,$00,$46,$00,$FF,$00
db $04,$01," ",$00,"c",$00," ",$00,"a",$00
db $04,$01,"o",$00,"u",$00," ",$00,"f",$00
db $04,$01,"n",$00," ",$00,"e",$00," ",$00
db $04,$01,"s",$00,"e",$00,$50,$00,"P",$00
db $04,$01,"n",$00,".",$00," ",$00,"C",$00
db $04,$01," ",$00," ",$00,"l",$00,"u",$00
db $04,$01," ",$00," ",$00,"b",$00,$55,$00
db $04,$01,$FF,$00,$40,$00,$FF,$00,$56,$00
db $04,$01,$41,$00,$41,$00,$56,$00,$56,$00
db $04,$01,"F",$00,"u",$00,$56,$00,$56,$00
db $04,$01,"n",$00,"!",$00,$56,$00,$56,$00
db $04,$01,$47,$00,$FF,$00,$56,$00,$FF,$00
