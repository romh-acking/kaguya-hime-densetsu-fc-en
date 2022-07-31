arch nes.cpu

define limit_cursor_X 			$99
define limit_cursor_Y 			$9a

define jump_cursor_X 			$98
define jump_cursor_Y 			$97

define LocationX 				$20

define AddressLo 				$22
define AddressHi 				$23
define StringLength				$1F

define TextLocation 			$7E00
define TextLocation2 			#$7E00

define MenuTextLocation 		$0700
define MenuTextLocation2 		#$0700

define Rom1BankSwitchFnc		$FFAA
define TempBank					$02
define LoadTextBank				$3C4EF

define MenuTableLocation 		#$E1D9

define TempLength				$7FFF


//regex
//Find
//[0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z]
//Replace
//db \$$&\n

//Find:
//[0-9A-Z][0-9A-Z]
//Replace:
//,\$$&

table "asm/tbl/CHR - Trans.tbl"

//==============================
//BANK 08
//==============================
banksize $4000
bank $08
// 20000
//==============================
//Move sprites 4 pixels to left
//==============================
 //0x21EA0
org $1EA0; base $9E90
jsr MoveSprite
nop
nop
Back:

//0x23220
org $3220; base $B210
MoveSprite:

MoveSpriteX:
lda $34
beq IsNotCoordX
cpy #$03
bne IsNotCoordX
lda $0056,y
sbc $34

sta ($25),y
rts

IsNotCoordX:

lda $35
beq IsNotCoordY
cpy #$00
bne IsNotCoordY
lda $0056,y
sbc $35

sta ($25),y
rts

IsNotCoordY:
lda $0056,y
sta ($25),y
rts

//==============================
//BANK 0B
//==============================
banksize $4000
bank $0B
// 2C000

//==============================
//Move sprites 4 pixels to left
//==============================

//0x02EA06
org $02A06
LDA #$1F
STA $96

//==============================
//look cursor default X
//==============================

// 2EA0E
org $02A0E; base $A9FE
LDA #$F0

//==============================
//look cursor right limit
//==============================

// 2EA47
org $02A47; base $AA37
lda #$1F

//==============================
//BANK 0D
//==============================
banksize $4000
bank $0D
// 34000

//==============================
// Currently selected item: quiz
//==============================

// $D170 is a general routine to determine where your cursor is column-wise.
// The result is returned in the Y register and indexed $9F
// Expanding the menus messed the logic of determining what column we're at.
// Therefore, we switch "beq branch_a" to "bne branch_a"

// This code is copy and pasted but is used exclusively for the quiz game
// 0x34F89
org $00F89; base $8f79
BNE branch_b
LDA $1E
CLC
ADC #$05
STA $1E
branch_b:
LDY $1E

//==============================
// Quiz cursor relocation
//==============================

// 0x34F99
org $00F99; base $8F89
lda #$13
sta $96

//==============================
//BANK 0E
//==============================
banksize $4000
bank $0E
// 38000

////////////////////////////////////////////////////////////////////////

//==============================
// Title screen
//==============================

//------------------
// Extend title screen 
//------------------

// Rom Address: 0x3979F
// NES address: $0E:178F
org $179F
lda #$05

//------------------
// Update bamboo stalk tilemap due to CHR change
//------------------

// Rom Address: 0x3BE25
// NES address: $0F:3E15
org $3E25

db $f8,$f9,$f8,$f9,$f8,$f9,$f8,$f9,$f8,$f9,$f8,$f9,$f8,$f9,$f8,$f9
db $f8,$f9,$f8,$f9,$f8,$f9,$f8,$f9,$f8,$f9,$f8,$f9,$f8,$f9,$f8,$f9

db $fa,$fb,$fa,$fb,$fa,$fb,$fa,$fb,$fa,$fb,$fa,$fb,$fa,$fb,$fa,$fb
db $fa,$fb,$fa,$fb,$fa,$fb,$fa,$fb,$fa,$fb,$fa,$fb,$fa,$fb,$fa,$fb

//------------------
// Update cut bamboo stalk tilemap due to CHR change
//------------------

// Rom Address: 0x39B20
// NES address: $0F:1B10

org $1B20
db $f6,$f7,$f6,$f7,$f6,$f7,$f6,$f7,$f6,$f7,$f6,$f7,$f6,$f7,$f6,$f7
db $f6,$f7,$f6,$f7,$f6,$f7,$f6,$f7,$f6,$f7,$f6,$f7,$f6,$f7,$f6,$f7

//------------------
// New Game
//------------------

// Rom Address: 0x397BA
// NES address: $0E:17AA

table "asm/tbl/CHR - Trans - Title Screen.tbl"

org $17BA
LDA #$30
STA {AddressLo}
LDA #$9B
STA {AddressHi}
LDA #$4C
STA {LocationX}
LDA #$22
STA $21
LDA #$0A
JSR $9805

// Rom Address: 0x39B40
// NES address: $0E:1B30

org $19B40
db "          "
db "NEW GAME  ",

//------------------
// Continue (Accent Mark #1)
//------------------
// Rom Address: 0x397CF
// NES address: $0E:97BF

org $17CF
LDA #$44
STA {AddressLo}
LDA #$9B
STA {AddressHi}
LDA #$8C
STA {LocationX}
LDA #$22
STA $21
LDA #$0A
STA $1F
LDA #$02
JSR $9C02
LDA #$90
STA {AddressLo}
LDA #$98
STA {AddressHi}
JSR $C7BB

// Rom Address: 0x39B54
// NES address: $0E:9B44
org $1B54
db "          "
db "CONTINUE  "

//------------------
// Bottom Text
//------------------

// Rom Address: 0x3981E
// NES address: $0E:980E

org $181E
LDA #$26
STA {LocationX}
LDA #$23
STA $21
LDA #$58
STA {AddressLo}
LDA #$9B
STA {AddressHi}
LDA #$15
STA $1F
LDA #$02
JSR $9C02

// ビクター ミュージカル インダストリーズ
// Rom Address: 0x39B68
// NES address: $0E:9B58
org $1B68
db "                     "
db $40,"VICTOR MUSICAL IND",$41," "

//------------------
// Move Cursor to the right
//------------------

// Rom Address: 0x3A070
// NES address: $0E:A060

org $2070
LDA #$58
STA $05B3

//==============================
// Default name
//==============================

// Rom Address: 0x0003AF20

// Original: おたかさん<$FF><$FF><$FF><$69>
table "asm/tbl/CHR - Trans.tbl"
org $2F20
db "Mr. Hero",$FF

//==============================
// File load screen
//==============================

table "asm/tbl/CHR - Trans.tbl"

// どの つづきに しますか？
org $2A23 // 0x3AA23
db "Select a file",$ff

//==============================
// File save screen
//==============================

// Where do you want to save?
org $2A7E // 0x3AA7E
lda #SaveMessageText
sta $22
sta $92
lda #SaveMessageText>>8
sta $23

// Cancel
org $2B6A // 0x3AB6A
lda #CancelText
sta $22
sta $92
lda #CancelText>>8
sta $23

//------------------
// File save screen: Overwrite: Pointers
//------------------

// Message
org $2EAB; base $AE9B // 0x3AEAB
lda #OverwriteConfirmPart1
sta $22
sta $92
lda #OverwriteConfirmPart1>>8
sta $23

org $2EC2; base $AEB2 // 0x3AEC2
lda #OverwriteConfirmPart2
sta $22
sta $92
lda #OverwriteConfirmPart2>>8
sta $23

// Yes
org $2ED7; base $AEC7 // 0x3AED7
lda #YesText
sta $22
sta $92
lda #YesText>>8
sta $23

org $2EEE; base $AEDE // 0x3AEEE
lda #NoText
sta $22
sta $92
lda #NoText>>8
sta $23

//==============================
// Continue/Quit screen
//==============================

org $2D80; base $AD70 // 0x3AD80
lda #ContinueText
sta $22
sta $92
lda #ContinueText>>8
sta $23

org $2D97; base $AD87 // 0x3AD97
lda #QuitText
sta $22
sta $92
lda #QuitText>>8
sta $23

//==============================
// Save screen Text
//==============================

//------------------
// File save screen
//------------------

// どれに きろくしますか
// Where do you want to save?
org $2E53; base $AE43 // 0x3AE53
SaveMessageText:
db "Save where?",$ff

// A9 71 85 22 85 92 A9 AE

// きろく しない
//org $2E5F; base $AE4F // 0x3AE5F
CancelText:
db "Cancel",$ff

//org $2E67; base $AE57 // 0x3AE67
//Unused?
// original: db "           ",$ff
db "        ",$ff

//------------------
// File save screen: Overwrite
//------------------

// まえの きろくが きえます
// いいですか
// The file will be overwritten.
// Is this okay?
//org $3AE73; base $AE63 // 0x3AE73
OverwriteConfirmPart1:
db "Is it okay to",$ff
//org $3AE81; base $AE71 // 0x3AE81
OverwriteConfirmPart2:
db "overwrite it?",$ff

// はい
// Yes
//org $2E87; base $AE77 // 0x3AE87

YesText:
db "Yes",$ff

// いいえ
// No
NoText:
db "No",$ff

//------------------
// Continue/Quit screen
//------------------

// つづき　を　する
//Continue
ContinueText:
db "Continue",$ff


// あわり　に　する
//Quit
QuitText:
db "Quit",$ff

//==============================
// Name screen: Name text
//==============================

org $2128; base $A118 // 0x3A2E3
LDA #$98
STA {AddressLo}
LDA #$e4
STA {AddressHi}
LDA #$C6
STA {LocationX}
LDA #$20
STA $21
LDA #$05
STA {StringLength}
LSR
STA $1E
JSR $C7CB

//------------------
// Text
//------------------

org $283E; base $A82E // 0x3A2E3
db $ea,$ea,$ea

//------------------
// Uppercase alpha
//------------------

org $2841; base $A831 // 0x3A2E3
db "A B C D E F G H I J"
db "                   "

db "K L M N O P Q R S T"
db "                   "

db "U V W X Y Z        "

db "                   "
db "                   "

db "                   "
db "                   "

db "                   "
db "          ",$90," ",$91," ",$92," ",$93," ",$93


db "a b c d e f g h i j"
db "                   "

db "k l m n o p q r s t"
db "                   "

db "u v w x y z        "

db "                   "
db "                   "

db "                   "
db "                   "

db "                   "
db "          ",$90," ",$91," ",$92," ",$93," ",$93

//==============================
// Name screen: Cursor default position
//==============================

org $2142; base $A132 // 0x3A2E3
lda #$6c
sta $05b4
lda #$3c
sta $059d

//------------------
// Adjust right boundary (A Button)
//------------------
org $21FC; base $A1EC // 0x3A2E3
//lda $05b4
//cmp #$AC

//------------------
// Adjust right boundary (A Button)
//------------------
org $21D8; base $A1C8 // 0x3A2E3
lda $05b4
cmp #$AC

//------------------
// Adjust right boundary (right arrow icon)
//------------------
org $21FC; base $A1EC // 0x3A2E3
lda $05b4
cmp #$AC

org $3A2F3; base $A2E3 // 0x3A2E3
lda $05b4
cmp #$AC

//------------------
// Adjust left boundary  (right arrow icon)
//------------------
org $22E3; base $A2D3 // 0x3A2E3
lda $05b4
cmp #$6C


//==============================
// Name screen: Adjust input ranges: lowercase offset
//==============================

// This changes where the lowercase letters start
// #$33 => #$1A
org $21D1; base $A1C1 // 0x3A1D1
adc #$1A

// The game has an extra check for 3C that's a needless 
// check, as your cursor can't go that far.
// We recycle this for other checks and change behavior
// when pressing 'A'.
org $21B9; base $A1A9; fill $08, $ea 
org $21B9; base $A1A9 // 0x3A1B9
// special icons
cmp #$37 
bcs $A1FC

// Print space after 'z'
cmp #$1A
bcs $A229

// print nothing: bcs $A18E

org $220C; base $A1FC; fill $12, $ea
org $220C; base $A1FC // 0x3A20C
sec
sbc #$33
asl
tay
lda $a20e,y
sta $22
lda $a20f,y
sta $23
jmp ($0022)

//==============================
// Difficulty Modes
//==============================

org $187c; base $986c // 3987c
EasyText:
db "    "
db "Easy"

HardText:
db "    "
db "Hard"

VeryHard:
db "         "
db "Difficult"

db $ea,$ea

// ふしう (Easy)
// むずかしい (Hard)
// とっても むずかしい (Very Hard)

// "Easy" pointer
org $183A; base $982A // 0x3983A
lda #EasyText
sta {AddressLo}
lda #EasyText>>8
sta {AddressHi}
lda #$ca
sta {LocationX}
lda #$21
sta $21
lda #$04
jsr $9805

// Hard
lda #HardText
sta {AddressLo}
lda #HardText>>8
sta {AddressHi}
lda #$0a
sta {LocationX}
lda #$22
sta $21
lda #$04
jsr $9805

// Very hard
lda #VeryHard
sta {AddressLo}
lda #VeryHard>>8
sta {AddressHi}
lda #$4a
sta {LocationX}
lda #$22
sta $21
lda #$09
jsr $9805
jmp $c81c

////////////////////////////////////////////////////////////////////////


//==============================
// Currently selected item
//==============================

//------------------
// Save file menu
//------------------

//0x3A681
org $02681; base $A671
lda #$97
sta $9f

//==============================
// Health Bar
//==============================

// Rom Address: 0x39BDC
// NES address: $0E:9BCC

org $01BDC
LDA #$E7
STA {LocationX}
LDA #$21
STA $21
LDA #$07
STA {AddressLo}
LDA #$9C
STA {AddressHi}
LDA #$01
JSR $9C02

//------------------
// Health text indexer offset
//------------------

org $021E2; base $A1D2 // 0x3A1D2
sbc #$ad



//==============================
//BANK 0F
//==============================
banksize $4000
bank $0F
// 3C000

//==============================
// Blank out old menu text pointers and text data
//==============================

// ROM: 0x3E361
org $2361; base $E351; fill $116, $ff

//==============================
// Menu Text Printing (Double lines)
//==============================

// There's a general function that prints text
// with the diatrics, however, this breaks pagination
// for the dialogue. So menu text gets a new function.

// Remove diacritic line in favor of supporting two lines

org $2361; base $E351
ReadMenuText:
jsr $C817
bne ReadMenuText

lda #$00
sta $4D
sta $94
jsr $D0CC

// This originally moved the line up
// For the double line hack, we don't want this and want
// to move the text *down* actually.
lda $20
sec
sbc #$00 // sbc #$20
sta $20

lda $21
sbc #$00
sta $21
ldx #$00
lda #$FF
sta $3D
lda #$00
sta $B8
ldy #$00

LabelFuncL:
lda $21
sta $0700,x
inx
lda $20
sta $0700,x

adc #$20
sta $20

inx
lda $4D
sta $0700,x
inx

lda #$00
sta {TempLength}

lda $94
and #$01
beq WriteTopLabel
jmp WriteBottomLabel

WriteTopLabel:
lda ($22),y
cmp #$FF
bne TopLabelNotEnd
jsr FinishTopLine

sta $0700,x

jmp $D4F3

TopLabelNotEnd:
cmp #$C3
bne TopLabelNotLineBreak

jsr FinishTopLine

// Lower bottom line by a tile
lda $20
adc #$20
sta $20

jmp LabelFuncL

TopLabelNotLineBreak:
sta $0700,x
inx
iny
inc $4D
jmp WriteTopLabel

WriteBottomLabel:
lda ($22),y
cmp #$FF
bne BottomLabelNotDone

txa
pha

// Place where length is stored. used for printing.
lda $4D
adc #$04

tax
lda {TempLength}
sta $0700,x
pla
tax

jmp $D4F3

BottomLabelNotDone:
sta $0700,x
inc {TempLength}
inx
iny
jmp WriteBottomLabel

FinishTopLine:
stx $4E
stx $2B

ldx #$02
lda $4D
sta $0700,x
ldx $4E
inc $94
lda $92
sta $22
lda $93
sta $23

tya
pha

jsr $D0CC

pla
tay
iny

rts

//==============================
// Read Menu Text Pointer (Expanded)
//==============================

org $0C01; base $CBF1; fill $20, $ea  //RAM: CBF1 //0x0003CC01
org $0C01; base $CBF1

// Hijack the pointer loading routine to load our 3 byte pointer
jsr MenuOptionLoadPointer

org $2418; base $E408 // 0x3E418
MenuOptionLoadPointer:
// 'A' currently contains the dialogue id
// $92 and $93 will contain our indexer after SetupIndexer.
// It will be 2 bytes, so it can't be stored in those 8-bit registers
// As a result, we add MenuTableLocation to the indexer.

sta $92
lda #$00
sta $93
jsr SetupIndexer

lda $92
adc {MenuTableLocation}&$FF //lo
sta $92

lda $93
adc {MenuTableLocation}>>8 // hi
sta $93

// The bank the menu options are at are variable.
// The game has specific functions to load each bank to save some space.
// Instead of utilizing those, get the bank address used to switch as it hasn't been blanked out yet,
// and store it in a random zeropage address. We'll use this later
lda $65
sta {TempBank}

ldy #$00
lda ($92),y
iny
sta $22
lda ($92),y
sta $23
iny
lda ($92),y
jsr {Rom1BankSwitchFnc}
jsr SwitchToRom2

lda {TempBank}
jsr {Rom1BankSwitchFnc}

jsr RelocateTextToMenuLocation

lda #$00
tax

// Redirects to our custom printing function to support double lines.
jsr ReadMenuText //jsr $CE80
rts

RelocateTextToMenuLocation:
lda #$00
tax
tay

RelocateTextToMenuLocationLoop:
lda {TextLocation},x
sta {MenuTextLocation},y

iny
inx

cmp #$FF
bne RelocateTextToMenuLocationLoop

rts

//==============================
//Menu Bar PPU location and counts
//==============================

//0x3CC9C
org $00C9C 

STA $1F
jsr AdjustScreenOffset
nop
JMP $C7CE
STA $1F
LDA #$01
STA $1E
JMP $C7CB
LDA #$E2
STA $20
LDA #$21
STA $21
LDA #$15
STA $22
LDA #$E5
STA $23
LDA #$05
JSR $CC8C
LDA #$61
STA $20
LDA #$20
STA $21
LDA #$BF
STA $22
LDA #$E4
STA $23
LDA #$01
STA $1F
LDA #$18
STA $1E
JSR $C7CE
LDA #$72
STA $20
LDA #$20
STA $21
LDA #$E6
STA $22
LDA #$E4
STA $23
LDA #$01
STA $1F
LDA #$0C
STA $1E
JSR $C7CB
LDA #$1c //item window
STA $20
LDA #$22
STA $21
LDA #$F2
STA $22
LDA #$E4
STA $23
LDA #$01
STA $1F
LDA #$0B
STA $1E
JSR $C7CE
LDA #$7c //item window
STA $20
LDA #$20
STA $21
LDA #$D7
STA $22
LDA #$E4
STA $23
LDA #$01
STA $1F
LDA #$0D
STA $1E
JSR $C7CB
LDA #$7f //item window (right part)
STA $20
LDA #$20
STA $21
LDA #$FD
STA $22
LDA #$E4
STA $23
LDA #$01
STA $1F
LDA #$18
STA $1E
JSR $C7CB
LDA #$62
STA $20
LDA #$20
STA $21
LDA #$8D
STA $22
LDA #$E4
STA $23
LDA #$10
JSR $CC8C
LDA #$62
STA $20
LDA #$20
STA $21
LDA #$8D
STA $22
LDA #$E4
STA $23
LDA #$10
JSR $CC95
LDA #$C2
STA $20
LDA #$21
STA $21
LDA #$A6
STA $22
LDA #$E4
STA $23
LDA #$10
JSR $CC8C
LDA #$02
STA $20
LDA #$22
STA $21
LDA #$8D
STA $22
LDA #$E4
STA $23
LDA #$1a //top textbox amount
JSR $CC8C
LDA #$42 //Score text Lo
STA $20
LDA #$23 //Score text Hi
STA $21
LDA #$A6
STA $22
LDA #$E4
STA $23
LDA #$1a //bottom textbox amount
JSR $CC8C
LDA #$7D //item window
STA $20
LDA #$20
STA $21
LDA #$8D
STA $22
LDA #$E4
STA $23
LDA #$02
JSR $CC8C
LDA #$5D //item window
STA $20
LDA #$23
STA $21
LDA #$A6
STA $22
LDA #$E4
STA $23
LDA #$02 //item box lower count
JSR $CC8C
LDA #$42 //Dialogue box lower
STA $20
LDA #$20
STA $21  //pointers text location
LDA #$89
STA $22
LDA #$E4
STA $23
LDA #$04
JSR $CC8C

org $3CDEF; fill $1a, $ea  //RAM: CDDF //0x3CDEF
jsr ActionTextDraw

//==============================
// Textbox pointers
//==============================

//Textboxes get tiles from a table.
//Have to expand the table by one byte
//Have to relocate the table to empty space
//------------------
// Textbox top
//------------------
org $00D52; base $CD42 //0x3CD52
LDA #TextboxData
STA $22
LDA #TextboxData>>8

org $00D67; base $CD57 //0x3CD67
LDA #TextboxData
STA $22
LDA #TextboxData>>8

org $00D91; base $CDC9 //0x3CD91
LDA #TextboxData
STA $22
LDA #TextboxData>>8

org $00DBB; base $CDAB //0x3CDBB
LDA #TextboxData
STA $22
LDA #TextboxData>>8

//------------------
// Blanking
//------------------

//Window Top and Bottom (BLANKED)
org $0249D; base $E48D //0x3E49D
db $ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea
db $ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$ea

//Score (BLANKED)
org $02499; base $E489 //0x3E499
db $ea,$ea,$ea,$ea

//------------------
// Textbox bottom
//------------------
org $00D7C; base $CD6C //0x3CD7C
LDA #$0a
STA $22
LDA #$fd

org $00DA6; base $CD96 //0x3CDA6
LDA #$0a
STA $22
LDA #$fd

org $00DD0; base $CDC0 //0x3CDD0
LDA #$0a
STA $22
LDA #$fd

//==============================
// Option Locations
//==============================
org $01B4C //0x3DB4C
lda #$13

org $00C3C //0x3CC3C
lda #$13

org $00C4C //0x3CC4C
lda #$18

org $00C55 //0x3CC55
lda #$18

//==============================
//Limit changer
//==============================
org $01b22 //0x3db22
lda #$00
sta $84
sta $85
sta $9e
lda #$13
sta $96
sta {limit_cursor_X}
lda #$18
sta {jump_cursor_X}
lda #$06
sta {jump_cursor_Y}
sta {limit_cursor_Y}
lda #$0e
sta $9b
lda #$05
sta $9c

//==============================
// Currently selected item
//==============================

// 3D194
org $01194; base $D184
BNE branch_a
LDA $1E
CLC
ADC #$05
STA $1E
branch_a:
LDY $1E

//==============================
// Speed up text printing
//==============================

// rom address: 3cfe5

org $0FE5; base $CFD5
lda #$00

//==============================
//Menu Constants
//==============================

org $00FA2 //0x3CFA2
LDA #$B3 //Menu Blanking area
STA $20
LDA #$20
STA $21
LDA #$0A
STA $88
LDA #$67
STA $22
LDA #$E4
STA $23

//==============================
//Menu blanking amount
//==============================

org $00FB6 //0x3CFB6
lda #$09

//==============================
//item cursor default X
//==============================

org $015BE //0x3D5BE
LDA #$1f

//==============================
//item cursor default X
//==============================

org $02DEF //0x3EDEF

LDA #$f0	//item sprite coord
STA $05B3,y
LDA #$82
STA $0585,y
LDA #$0B
STA $05F8,y
LDA #$03
STA $05E1,y

//==============================
//Score PPU data
//==============================

org $0DDD; base $CDCD //0x3CDDD
lda #$42	//ppu lo
sta $20
lda #$20	//ppu hi
sta $21
lda #$89
sta $22
lda #$e4
sta $23
lda #$04
jsr $cc8c


org $3E491; base $E481 //0x3E491
db $ea,$ea,$ea,$ea
org $3E495; base $E485 //0x3E495
db $ea,$ea,$ea,$ea

//==============================
// Misc Text
//==============================

org $02491; base $E481 //0x3E491
db "Actions"

org $0249D; base $E48D //0x3E49D
db "Score:"

org $024A8; base $E498 //0x3E4A8
db "Name:"
db "     "

//==============================
// Health text
//==============================

// Rom Address: 0x3CCAE
// NES address: $0F:CC9E

org $0CAE; base $CC9E
lda #$e2
sta {LocationX}
lda #$21
sta $21
lda #$15
sta {AddressLo}
lda #$E5
sta {AddressHi}
lda #$05
jsr $cc8c

org $02525; base $E515 //0x3E525
db "HP   "

// allow 'e' to have an accent mark
org $253E; base $E52E  // 0x3E53E
db "e"

//------------------
// Graphic pointer
//------------------

org $0DE5; base $CDD5 //0x3CDE5
LDA #$8D
STA $22
LDA #$E4
STA $23
LDA #$06
JSR $CC8C

//==============================
// Dialogue pointer table (Expanded)
//==============================

//------------------
// Adjust indexer
//------------------
org $174A; base $D73A; fill $2f, $ea // 0x3D74A
org $174A; base $D73A;

DialogueRoutine:
txa
sta $02

jsr $c81c
lda #$ff
sta $ba
jsr {LoadTextBank}

jsr SetupIndexer

lda $93
adc #$80
sta $93
ldy #$00
lda ($92),y
iny
sta $22
lda ($92),y
sta $23
iny
lda ($92),y
jsr {Rom1BankSwitchFnc}
jsr SwitchToRom2

lda $02
tax

DialogueRoutineReturn:
ldy #$00
lda ($22),y
cmp #$ff
bne DialogueRoutineBranchA
lda $44
beq DialogueRoutineBranchB
rts

org $17B1; base $D7A1 // 0x3D7B1
DialogueRoutineBranchA:

org $1783; base $D773 // 0x3D783
DialogueRoutineBranchB:

// Start
org $197E; base $D96E // 0x3D97E
jmp DialogueRoutineReturn

// Name handling (End)
org $17F8; base $D7E8 // 0x3D7F8
jsr DialogueRoutineReturn

// Name handling
org $180F; base $D7FF // 0x3D80F
jmp DialogueRoutineReturn

//==============================
// Control code #$C9
//==============================

// For the control code that displays seiko's golden bullet prediction.
// Recoded this function to no longer reference the menu options data
// as referencing the expanded bank is a bit of a hassle here.
// Therefore, we setup our own pointer table and text data. 
// The code was optimized to reference a pointer table instead of hardcoding the pointers.
// The code optimization lets us fit in more custom logic.
// FWIW, まんなか isn't located with the menu options.

org $1877; base $D867; fill $4f, $ea // 0x0003D879
org $1877; base $D867 // 0x0003D879
cmp #$CE
bne BulletTextSUB

jsr SaveDialoguePointer
lda $FB
beq BulletTextSUB

BulletOrientationTable:
db BulletOrientationLeft>>8&$FF, BulletOrientationLeft&$FF
db BulletOrientationMiddle>>8&$FF, BulletOrientationMiddle&$FF
db BulletOrientationRight>>8&$FF, BulletOrientationRight&$FF

BulletOrientationLeft:
// ヒダリ RAM: E2BD (Id: 1)
db "left",$ff
BulletOrientationMiddle:
// まんなか, RAM: D8B6 (Id: 2)
db "middle",$ff
BulletOrientationRight:
// ミギ RAM: E2C1 (Id: 3)
db "right",$ff

BulletTextSUB:
cmp #$C9
bne $D8BB

jsr SaveDialoguePointer

lda $0538
sbc #$1
asl
tay
lda BulletOrientationTable+1,y
sta $92
sta $22
lda BulletOrientationTable,y

PrintScoreChange:
sta $93
sta $23
jsr $D766
jmp $D7EB

SaveDialoguePointer:
lda $22
sta $89
lda $23
sta $8A
rts

//------------------
// 
//------------------

org $18DF; base $D8CF // 0x0003D8DF
jmp PrintScoreChange

org $18F6; base $D8E6 // 0x0003D8F6
jmp PrintScoreChange

//==============================
//Screen scroll reset after shaking
//==============================
org $0353A; base $F52A //0x3F53A
jsr ScreenResetAfterShakeFX
nop
nop
nop

//==============================
//Screen Shaking
//==============================
org $03519 ;base $F509 //0x3F519
LDA #$08
STA $B6
JSR $F531
LDA #$FC
STA $B6

//remove sprite movement for shaking
org $03565 ;base $F555 //0x3F565
nop
nop
nop

//remove sprite movement for shaking
org $03549 ;base $F539 //0x3F549
nop
nop
nop

//remove sprite movement for shaking
org $3552; base $F542 //0x3F552
nop
nop
nop

org $356E; base $F55E //0x3F56E
nop
nop
nop

//==============================
//Bank switch
//==============================

//------------------
// Free Space
//------------------

org $03d00; base $FCF0 //0x3fd00
TextboxData:
db $86,$86,$86,$86,$86,$86,$86,$86,$86,$86,$86,$86,$86,$86,$86,$86,$86,$86,$86,$86,$86,$86,$86,$86,$86,$86
db $8b,$8b,$8b,$8b,$8b,$8b,$8b,$8b,$8b,$8b,$8b,$8b,$8b,$8b,$8b,$8b,$8b,$8b,$8b,$8b,$8b,$8b,$8b,$8b,$8b,$8b

//Initiated when you start the game.
AdjustScreenOffset:
LDA #$01
STA $1E

lda #$04
sta $34
rts

ScreenResetAfterShakeFX:
LDA #$00
STA $35
LDA #$04
STA $34
rts

ActionTextDraw:
LDA #$94 //Actions
STA {LocationX}
LDA #$20
STA $21
LDA #$81
STA $22
LDA #$E4
STA $23
LDA #$07
STA $1F
LDA #$01
STA $1E
JSR $C7CB
rts

SwitchToRom2:
lda #$10
sta $a000
lsr
sta $a000
lsr
sta $a000
lsr
sta $a000
lsr
sta $a000
rts

// A MMC1 512KB mapper treats the latter half of the rom as a seperate rom
// and jumps to it immediately after a switch.

SetupBankSwitch:
sta $23

iny
lda ($92),y
jsr {Rom1BankSwitchFnc}

lda $23
sta $93

rts

SetupIndexer:
asl $92
rol $93
asl $92
rol $93

lda $92
clc
adc #$00
sta $92

rts

//==============================
//BANK 1F
//==============================
banksize $4000
bank $1F
// 3C000

//==============================
//Bank switch
//==============================

org $0010; base $C000 // 0x7C010
TranscribeText:

ldy #$00
ldx #$00
TranscribeTextLoop:

lda ($22),y
sta {TextLocation},x
iny
inx

cmp #$ff
beq TranscribeTextDone

jmp TranscribeTextLoop

TranscribeTextDone:

// Clear X register to prevent bugs.
// The game expects this to be zero after the text is processed
lda #$00
tax

// Force the game to read from our new text location
lda {TextLocation2}>>8
sta $23
sta $93
lda {TextLocation2}<<8>>8
sta $22
sta $92

lda #$06
jsr Rom2BankSwitchFnc
jmp SwitchToRom1

org $3FBC; base $FFAC // 0x3FFC4
Rom2BankSwitchFnc:
  lda $66
  sta $feff
  lsr
  sta $feff
  lsr
  sta $feff
  lsr
  sta $feff
  lsr
  sta $feff
rts

cleartable 
db "Translated By: FCandChill, TheMajinZenki, and friends"

// This function is stratigically positioned so after the switch, the PC
// is plopped right at SwitchToRom2
org $3D62; base $FD52 // 0x7FD62
SwitchToRom1:
lda #$00
sta $a000
lsr
sta $a000
lsr
sta $a000
lsr
sta $a000
lsr
sta $a000

// A MMC1 512KB mapper treats the latter half of the rom as a seperate rom
// and jumps to it immediately after a switch.
org $3D77; base $FD67 // 0x7FD77
jmp TranscribeText




// The game normally NMIs to $C082
// This becomes a problem when switching to the "second" rom
// An NMI (which can't be surpressed), will jump to $FFFF if we take too long
// in the second rom (reading a long string).
// My hacky solution, is to kill the NMI at where it jumps
header
org $3FFF; base $ffff 
rti
