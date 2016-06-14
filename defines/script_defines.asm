; All scripting macros off of XSE and http://sphericalice.com/romhacking/documents/script/index.html

; Comparing stuff for if1 and if2
lessthan       equ 0 ; A is less than B
equal          equ 1 ; A is equal to B
greaterthan    equ 2 ; A is more than B
lessorequal    equ 3 ; A is less than or equal to B
greaterorequal equ 4 ; A is greater than or equal to B
notequal       equ 5 ; A is not equal to B

; Macro macros, from XSE.

.macro msg, address
	loadpointer 0, address
	callstd 0
.endmacro

.macro msgbox, address, type
	loadpointer 0, address
	callstd type
.endmacro

.macro giveitem, item, amount, msgtype
	copyvarifnotzero 0x8000, item
	copyvarifnotzero 0x8001, amount
	callstd msgtype
.endmacro

.macro giveitem2, item, amount, song
	copyvarifnotzero 0x8000, item
	copyvarifnotzero 0x8001, amount
	copyvarifnotzero 0x8002, song
	callstd 9
.endmacro

.macro giveitem3, decoration
	copyvarifnotzero 0x8000, decoration
	callstd 7
.endmacro

.macro wildbattle, species, level, item
	setwildbattle species, level, item
	dowildbattle
.endmacro

.macro registernav, trainer
	copyvarifnotzero 0x8000, trainer
	callstd 8
.endmacro


; padz macros

.macro switch, var
	copyvar 0x8000, var
.endmacro

.macro case, value, address
	compare 0x8000, value
	if1 1, address
.endmacro


; Commands
.macro nop
	.byte 0x0
.endmacro

.macro nop1
	.byte 0x1
.endmacro

.macro end
	.byte 0x2
.endmacro

.macro return
	.byte 0x3
.endmacro

.macro call, dest
	.byte 0x4
	.word dest
.endmacro

.macro goto, destination
	.byte 0x5
	.word destination
.endmacro

.macro if1, condition, destination
	.byte 0x6
	.byte condition
	.word destination
.endmacro

.macro if2, condition, destination
	.byte 0x7
	.byte condition
	.word destination
.endmacro

.macro gotostd, param1
	.byte 0x8
	.byte param1
.endmacro

.macro callstd, std
	.byte 0x9
	.byte std
.endmacro

.macro gotostdif, cond, param1
	.byte 0xA
	.byte cond
	.byte param1
.endmacro

.macro callstdif, cond, param1
	.byte 0xB
	.byte cond
	.byte param1
.endmacro

; jumpram's documentation may not be complete
.macro jumpram
	.byte 0xC
.endmacro

.macro killscript
	.byte 0xD
.endmacro

.macro setbyte, value
	.byte 0xE
	.byte value
.endmacro

.macro loadpointer, bank, address
	.byte 0xF
	.byte bank
	.word address
.endmacro

.macro setbyte2, bank, value
	.byte 0x10
	.byte bank
	.byte value
.endmacro

.macro writebytetooffset, byte, pointer
	.byte 0x11
	.byte byte
	.word pointer
.endmacro

.macro loadbytefrompointer, bank_dest, pointer
	.byte 0x12
	.byte bank_dest
	.word pointer
.endmacro

.macro setfarbyte, bank, pointer
	.byte 0x13
	.byte bank
	.word pointer
.endmacro

.macro copyscriptbanks, bank_destination, bank_source
	.byte 0x14
	.byte bank_destination
	.byte bank_source
.endmacro

.macro copybyte, dest, source
	.byte 0x15
	.word dest
	.word source
.endmacro

.macro setvar, var, value
	.byte 0x16
	.hword var
	.hword value
.endmacro

.macro addvar, var, value
	.byte 0x17
	.hword var
	.hword value
.endmacro

.macro subvar, var, value
	.byte 0x18
	.hword var
	.hword value
.endmacro

.macro copyvar, destination, source
	.byte 0x19
	.hword destination
	.hword source
.endmacro

.macro copyvarifnotzero, var, source
	.byte 0x1A
	.hword var
	.hword source
.endmacro

.macro comparebanks, a, b
	.byte 0x1B
	.byte a
	.byte b
.endmacro

.macro comparebanktobyte, bank, byte
	.byte 0x1C
	.byte bank
	.byte byte
.endmacro

.macro comparebanktofarbyte, comparebbanktofarbyte_bank, pointer
	.byte 0x1D
	.byte bank
	.word pointer
.endmacro

.macro comparefarbytetobank, pointer, bank
	.byte 0x1E
	.word pointer
	.byte bank
.endmacro

.macro comparefarbytetobyte, pointer, byte
	.byte 0x1F
	.word pointer
	.byte byte
.endmacro

.macro comparefarbytes, param1, param2
	.byte 0x20
	.word param1
	.word param2
.endmacro

.macro compare, var, value
	.byte 0x21
	.hword var
	.hword value
.endmacro

.macro comparevars, var1, var2
	.byte 0x22
	.hword var1
	.hword var2
.endmacro

.macro callasm, pointer
	.byte 0x23
	.word pointer
.endmacro

.macro cmd24, pointer
	.byte 0x24
	.word pointer
.endmacro

.macro special, param
	.byte 0x25
	.hword param
.endmacro

.macro special2, outputvar, function
	.byte 0x26
	.hword outputvar
	.hword function
.endmacro

.macro waitstate
	.byte 0x27
.endmacro

.macro pause, time
	.byte 0x28
	.hword time
.endmacro

.macro setflag, flag
	.byte 0x29
	.hword flag
.endmacro

.macro clearflag, flag
	.byte 0x2A
	.hword flag
.endmacro

.macro checkflag, flag
	.byte 0x2B
	.hword flag
.endmacro

; nop in FR
.macro cmd2C
	.byte 0x2C
.endmacro

; nop in FR, no other info right now.
.macro checkdailyflags
	.byte 0x2D
.endmacro

.macro resetvars
	.byte 0x2E
.endmacro

.macro sound, id
	.byte 0x2F
	.hword id
.endmacro

.macro checksound
	.byte 0x30
.endmacro

.macro fanfare, id
	.byte 0x31
	.hword id
.endmacro

.macro waitfanfare
	.byte 0x32
.endmacro

.macro playsong, songid, unknown
	.byte 0x33
	.hword songid
	.byte unknown
.endmacro

.macro playsong2, song
	.byte 0x34
	.hword song
.endmacro

.macro fadedefault
	.byte 0x35
.endmacro

.macro fadesong, song
	.byte 0x36
	.hword song
.endmacro

.macro fadeout, speed
	.byte 0x37
	.byte speed
.endmacro

.macro fadein, speed
	.byte 0x38
	.byte speed
.endmacro

.macro warp, bank, map, warp, x_axis, y_axis
	.byte 0x39
	.byte bank
	.byte map
	.byte warp
	.hword x_axis
	.hword y_axis
.endmacro

.macro warpmuted, bank, map, warp, x_axis, y_axis
	.byte 0x3A
	.byte bank
	.byte map
	.byte warp
	.hword x_axis
	.hword y_axis
.endmacro

.macro warpwalk, bank, map, warp, x_axis, y_axis
	.byte 0x3B
	.byte bank
	.byte map
	.byte warp
	.hword x_axis
	.hword y_axis
.endmacro

.macro warphole, bank, map
	.byte 0x3C
	.byte bank
	.byte map
.endmacro

.macro warpteleport, bank, map, warp, x_axis, y_axis
	.byte 0x3D
	.byte bank
	.byte map
	.byte warp
	.hword x_axis
	.hword y_axis
.endmacro

.macro warp3, bank, map, warp, x_axis, y_axis
	.byte 0x3E
	.byte bank
	.byte map
	.byte warp
	.hword x_axis
	.hword y_axis
.endmacro

.macro setwarpplace, bank, map, warp, x_axis, y_axis
	.byte 0x3F
	.byte bank
	.byte map
	.byte warp
	.hword x_axis
	.hword y_axis
.endmacro

.macro warp4, bank, map, warp, x_axis, y_axis
	.byte 0x40
	.byte bank
	.byte map
	.byte warp
	.hword x_axis
	.hword y_axis
.endmacro

.macro warp5, bank, map, warp, x_axis, y_axis
	.byte 0x41
	.byte bank
	.byte map
	.byte warp
	.hword x_axis
	.hword y_axis
.endmacro

.macro getplayerpos, x_var, y_var
	.byte 0x42
	.hword x_var
	.hword y_var
.endmacro

.macro countpokemon
	.byte 0x43
.endmacro

.macro additem, index, quantity
	.byte 0x44
	.hword index
	.hword quantity
.endmacro

.macro removeitem, index, quantity
	.byte 0x45
	.hword index
	.hword quantity
.endmacro

.macro checkitemroom, index, quantity
	.byte 0x46
	.hword index
	.hword quantity
.endmacro

.macro checkitem, index, quantity
	.byte 0x47
	.hword index
	.hword quantity
.endmacro

.macro checkitemtype, index
	.byte 0x48
	.hword index
.endmacro

.macro addpcitem, index, quantity
	.byte 0x49
	.hword index
	.hword quantity
.endmacro

.macro checkpcitem, index, quantity
	.byte 0x4A
	.hword index
	.hword quantity
.endmacro

.macro adddecoration, decoration
	.byte 0x4B
	.hword decoration
.endmacro

.macro removedecoration, decoration
	.byte 0x4C
	.hword decoration
.endmacro

.macro testdecoration, decoration
	.byte 0x4D
	.hword decoration
.endmacro

.macro checkdecoration, decoration
	.byte 0x4E
	.hword decoration
.endmacro

.macro applymovement, person_id, pointer
	.byte 0x4F
	.hword person_id
	.word pointer
.endmacro

.macro applymovementpos, var, pointer
	.byte 0x50
	.hword var
	.word pointer
.endmacro

.macro waitmovement, index
	.byte 0x51
	.hword index
.endmacro

.macro waitmovementpos, index, x, y
	.byte 0x52
	.hword index
	.byte x
	.byte y
.endmacro

.macro hidesprite, param
	.byte 0x53
	.hword param
.endmacro

.macro hidespritepos, index, x, y
	.byte 0x54
	.hword index
	.byte x
	.byte y
.endmacro

.macro faceplayer
	.byte 0x5A
.endmacro

.macro trainerbattle0, type, index, filler, intro, loss
	.byte 0x5C
	.byte 0x0
	.hword index
	.hword filler
	.word intro
	.word loss
.endmacro

.macro trainerbattle1, type, index, filler, intro, loss, extra
	.byte 0x5C
	.byte 0x1
	.hword index
	.hword filler
	.word intro
	.word loss
	.word extra
.endmacro

.macro trainerbattle2, type, index, filler, intro, loss, extra
	.byte 0x5C
	.byte 0x2
	.hword index
	.hword filler
	.word intro
	.word loss
	.word extra
.endmacro

.macro trainerbattle3, type, index, filler, intro
	.byte 0x5C
	.byte 0x3
	.hword index
	.hword filler
	.word intro
.endmacro

.macro trainerbattle4, type, index, filler, intro, loss, extra
	.byte 0x5C
	.byte 0x4
	.hword index
	.hword filler
	.word intro
	.word loss
	.word extra
.endmacro

.macro trainerbattle5, type, index, filler, intro, loss
	.byte 0x5C
	.byte 0x5
	.hword index
	.hword filler
	.word intro
	.word loss
.endmacro

.macro trainerbattle6, type, index, filler, intro, loss, extra, extra2
	.byte 0x5C
	.byte 0x6
	.hword index
	.hword filler
	.word intro
	.word loss
	.word extra
	.word extra2
.endmacro

.macro trainerbattle7, type, index, filler, intro, loss, extra
	.byte 0x5C
	.byte 0x7
	.hword index
	.hword filler
	.word intro
	.word loss
	.word extra
.endmacro

.macro trainerbattle8, type, index, filler, intro, loss, extra, extra2
	.byte 0x5C
	.byte 0x8
	.hword index
	.hword filler
	.word intro
	.word loss
	.word extra
	.word extra2
.endmacro

.macro trainerbattle9, type, index, filler, intro, loss
	.byte 0x5C
	.byte 0x9
	.hword index
	.hword filler
	.word intro
	.word loss
.endmacro

.macro repeattrainerbattle
	.byte 0x5D
.endmacro

.macro endtrainerbattle
	.byte 0x5E
.endmacro

.macro endtrainerbattle2
	.byte 0x5F
.endmacro

.macro checktrainerflag, trainer
	.byte 0x60
	.hword trainer
.endmacro

; XSE had it wrong, i'm correcting them
.macro settrainerflag, trainer
	.byte 0x61
	.hword trainer
.endmacro

.macro cleartrainerflag, trainer
	.byte 0x62
	.hword trainer
.endmacro

.macro movesprite2, person, x, y
	.byte 0x63
	.hword person
	.hword x
	.hword y
.endmacro

.macro moveoffscreen, person
	.byte 0x64
	.hword person
.endmacro

.macro spritebehave, person, behaviour
	.byte 0x65
	.hword person
	.byte behavior
.endmacro

.macro waitmsg
	.byte 0x66
.endmacro

.macro preparemsg, text
	.byte 0x67
	.word text
.endmacro

.macro closeonkeypress
	.byte 0x68
.endmacro

.macro lockall
	.byte 0x69
.endmacro

.macro lock
	.byte 0x6A
.endmacro

.macro releaseall
	.byte 0x6B
.endmacro

.macro release
	.byte 0x6C
.endmacro

.macro waitkeypress
	.byte 0x6D
.endmacro

.macro yesnobox, x, y
	.byte 0x6E
	.byte x
	.byte y
.endmacro

.macro multichoice, x, y, list, b_enabled
	.byte 0x6F
	.byte x
	.byte y
	.byte list
	.byte b_enabled
.endmacro

.macro multichoice2, x, y, list, default_pos, b_enabled
	.byte 0x70
	.byte x
	.byte y
	.byte list
	.byte default_pos
	.byte b_enabled
.endmacro

.macro multichoice3, x, y, list, item_per_row, b_enabled
	.byte 0x71
	.byte x
	.byte y
	.byte list
	.byte items_per_row
	.byte b_enabled
.endmacro

.macro showbox, left_pos, top_pos, width, height
	.byte 0x72
	.byte left_pos
	.byte top_pos
	.byte width
	.byte height
.endmacro

.macro hidebox, left_pos, top_pos, width, height
	.byte 0x73
	.byte left_pos
	.byte top_pos
	.byte width
	.byte height
.endmacro

.macro clearbox, left_pos, top_pos, width, height
	.byte 0x74
	.byte left_pos
	.byte top_pos
	.byte width
	.byte height
.endmacro

.macro showpokepic, species, x, y
	.byte 0x75
	.hword species
	.byte x
	.byte y
.endmacro

.macro hidepokepic
	.byte 0x76
.endmacro

.macro showcontestwinner, byte
	.byte 0x77
	.byte byte
.endmacro

.macro braille, text
	.byte 0x78
	.word text
.endmacro

.macro givepokemon, species, level, item, unknown1, unknown2, unknown3
	.byte 0x79
	.hword species
	.byte level
	.hword item
	.word unknown1
	.word unknown2
	.byte unknown3
.endmacro

.macro giveegg, species
	.byte 0x7A
	.hword species
.endmacro

.macro setpkmnpp, party_slot, attk_slot, amount
	.byte 0x7B
	.byte party_slot
	.byte attk_slot
	.byte amount
.endmacro

.macro checkattack, attack
	.byte 0x7C
	.hword attack
.endmacro

.macro bufferpokemon, buffer, species
	.byte 0x7D
	.byte buffer
	.hword species
.endmacro

.macro bufferfirstpokemon, buffer
	.byte 0x7E
	.byte buffer
.endmacro

.macro bufferpartypokemon, buffer, slot
	.byte 0x7F
	.byte buffer
	.hword slot
.endmacro

.macro bufferitem, buffer, item
	.byte 0x80
	.byte buffer
	.hword item
.endmacro

.macro bufferdecoration, buffer, decoration
	.byte 0x81
	.byte buffer
	.hword decoration
.endmacro

.macro bufferattack, buffer, attack
	.byte 0x82
	.byte buffer
	.hword attack
.endmacro

.macro buffernumber, buffer, number
	.byte 0x83
	.byte buffer
	.hword number
.endmacro

.macro bufferstd, buffer, string
	.byte 0x84
	.byte buffer
	.hword string
.endmacro

.macro bufferstring, buffer, pointer
	.byte 0x85
	.byte buffer
	.hword pointer
.endmacro

.macro pokemart, pointer
	.byte 0x86
	.word pointer
.endmacro

.macro pokemart2, pointer
	.byte 0x87
	.word pointer
.endmacro

.macro pokemart3, pointer
	.byte 0x88
	.word pointer
.endmacro

.macro pokecasino, param1
	.byte 0x89
	.hword param1
.endmacro

.macro cmd8A
	.byte 0x8A
.endmacro

.macro choosecontestpokemon
	.byte 0x8B
.endmacro

.macro startcontest
	.byte 0x8C
.endmacro

.macro showcontestresults
	.byte 0x8D
.endmacro

.macro contestlinktransfer
	.byte 0x8E
.endmacro

.macro random, limit
	.byte 0x8F
	.hword limit
.endmacro

.macro givemoney, value, byte
	.byte 0x90
	.word value
	.byte byte
.endmacro

.macro paymoney, value, byte
	.byte 0x91
	.word value
	.byte byte
.endmacro

.macro checkmoney, value, byte
	.byte 0x92
	.word value
	.byte byte
.endmacro

.macro showmoney, x, y
	.byte 0x93
	.byte x
	.byte y
.endmacro

.macro hidemoney, x, y
	.byte 0x94
	.byte x
	.byte y
.endmacro

.macro updatemoney, x, y
	.byte 0x95
	.byte x
	.byte y
.endmacro

.macro cmd96
	.byte 0x96
.endmacro

.macro fadescreen, effect
	.byte 0x97
	.byte effect
.endmacro

.macro fadescreendelay, effect, time
	.byte 0x98
	.byte effect
	.byte time
.endmacro

.macro darken, size
	.byte 0x99
	.hword size
.endmacro

.macro lighten, size
	.byte 0x9A
	.byte size
.endmacro

.macro preparmsg2, preparemsg2_pointer
	.byte 0x9B
	.word pointer
.endmacro

.macro doanimation, param
	.byte 0x9C
	.hword param
.endmacro

.macro setanimation, anim, slot
	.byte 0x9D
	.byte anim
	.hword slot
.endmacro

.macro checkanimation, param
	.byte 0x9E
	.hword param
.endmacro

.macro sethealingplace, param
	.byte 0x9F
	.hword param
.endmacro

.macro checkgender
	.byte 0xA0
.endmacro

.macro cry, species, effect
	.byte 0xA1
	.hword species
	.hword effect
.endmacro

.macro setmaptile, x, y, tile, attrib
	.byte 0xA2
	.hword x
	.hword y
	.hword tile
	.hword attrib
.endmacro

.macro resetweather
	.byte 0xA3
.endmacro

.macro setweather, type
	.byte 0xA4
	.hword type
.endmacro

.macro doweather
	.byte 0xA5
.endmacro

.macro cmdA6, byte
	.byte 0xA6
	.byte byte
.endmacro

.macro setmapfooter, param
	.byte 0xA7
	.hword param
.endmacro

.macro spritelevelup, person, bank, map, unknown
	.byte 0xA8
	.hword person
	.byte bank
	.byte map
	.byte unknown
.endmacro

.macro restorespritelevel, person, bank, map
	.byte 0xA9
	.hword person
	.byte bank
	.byte map
.endmacro

.macro createsprite, sprite, person, x, y, behave, face
	.byte 0xAA
	.byte sprite
	.byte person
	.hword x
	.hword y
	.byte behave
	.byte face
.endmacro

.macro spriteface2, person, face
	.byte 0xAB
	.byte person
	.byte face
.endmacro

.macro setdooropened, x, y
	.byte 0xAC
	.hword x
	.hword y
.endmacro

.macro setdoorclosed, x, y
	.byte 0xAD
	.hword x
	.hword y
.endmacro

.macro doorchange
	.byte 0xAE
.endmacro

.macro setdooropened2, x, y
	.byte 0xAF
	.hword x
	.hword y
.endmacro

.macro setdoorclosed2, x, y
	.byte 0xB0
	.hword x
	.hword y
.endmacro

.macro cmdB1
	.byte 0xB1
.endmacro

.macro cmdB2
	.byte 0xB2
.endmacro

.macro checkcoins, var
	.byte 0xB3
	.hword var
.endmacro

.macro givecoins, param
	.byte 0xB4
	.hword param
.endmacro

.macro removecoins, param
	.byte 0xB5
	.hword param
.endmacro

.macro setwildbattle, species, level, item
	.byte 0xB6
	.hword species
	.byte level
	.hword item
.endmacro

.macro dowildbattle
	.byte 0xB7
.endmacro

.macro setvirtualaddress, param
	.byte 0xB8
	.word param
.endmacro

.macro virtualgoto, pointer
	.byte 0xB9
	.word pointer
.endmacro

.macro virtualcall, pointer
	.byte 0xBA
	.word pointer
.endmacro

.macro virtualgotoif, condition, pointer
	.byte 0xBB
	.byte condition
	.word pointer
.endmacro

.macro virtualcallif, condition, pointer
	.byte 0xBC
	.byte condition
	.word pointer
.endmacro

.macro virtualmsgbox, text
	.byte 0xBD
	.word text
.endmacro

.macro virtualloadpointer, pointer
	.byte 0xBE
	.word pointer
.endmacro

.macro virtualbuffer, buffer, pointer
	.byte 0xBF
	.byte buffer
	.word pointer
.endmacro

.macro showcoins, x, y
	.byte 0xC0
	.byte x
	.byte y
.endmacro

.macro hidecoins, x, y
	.byte 0xC1
	.byte x
	.byte y
.endmacro

.macro updatecoins, x, y
	.byte 0xC2
	.byte x
	.byte y
.endmacro

.macro cmdC3, hidden_var
	.byte 0xC3
	.hword hidden_var
.endmacro

.macro warp6, bank, map, warp, x, y
	.byte 0xC4
	.byte bank
	.byte map
	.byte warp
	.hword x
	.hword y
.endmacro

.macro waitcry
	.byte 0xC5
.endmacro

.macro bufferboxname, buffer, box
	.byte 0xC6
	.byte buffer
	.hword box
.endmacro

.macro textcolor, byte
	.byte 0xC7
	.byte byte
.endmacro

.macro cmdC8, param
	.byte 0xC8
	.word param
.endmacro

.macro cmdC9
	.byte 0xC9
.endmacro

.macro signmsg
	.byte 0xCA
.endmacro

.macro normalmsg
	.byte 0xCB
.endmacro

.macro comparehiddenvar, byte, value
	.byte 0xCC
	.byte byte
	.word value
.endmacro

.macro setobedience, slot
	.byte 0xCD
	.hword slot
.endmacro

.macro checkobedience, slot
	.byte 0xCE
	.hword slot
.endmacro

.macro executeram
	.byte 0xCF
.endmacro

.macro setworldmapflag, param
	.byte 0xD0
	.hword param
.endmacro

.macro warpteleport2
	.byte 0xD1
.endmacro

.macro setcatchlocation, slot, map
	.byte 0xD2
	.hword slot
	.byte map
.endmacro

.macro braille2, text
	.byte 0xD3
	.word text
.endmacro

.macro bufferitems, buffer, item, amount
	.byte buffer
	.hword item
	.hword amount
.endmacro

.macro cmdD5
	.byte 0xD5
.endmacro

.macro cmdD6
	.byte 0xD6
.endmacro

.macro warp7, bank, map, warp, x, y
	.byte 0xD7
	.byte bank
	.byte map
	.byte warp
	.hword x
	.hword y
.endmacro

.macro cmdD8
	.byte 0xD8
.endmacro

.macro cmdD9
	.byte 0xD9
.endmacro

.macro hidebox2
	.byte 0xDA
.endmacro

.macro preparemsg3, pointer
	.byte 0xDB
	.word pointer
.endmacro

.macro fadescreen3, param
	.byte 0xDC
	.byte param
.endmacro

.macro buffertrainerclass, buffer, class
	.byte 0xDD
	.byte buffer
	.hword class
.endmacro

.macro buffertrainername, buffer, trainer
	.byte 0xDE
	.byte buffer
	.hword trainer
.endmacro

.macro pokenavcall, text
	.byte 0xDF
	.word text
.endmacro

.macro warp8, bank, map, warp, x, y
	.byte 0xE0
	.byte bank
	.byte map
	.byte warp
	.hword x
	.hword y
.endmacro

.macro buffercontesttype, param1, param2
	.byte 0xE1
	.byte param1
	.hword param2
.endmacro

.macro bufferitems2, buffer, item, amount
	.byte 0xE2
	.byte buffer
	.hword item
	.hword amount
.endmacro
