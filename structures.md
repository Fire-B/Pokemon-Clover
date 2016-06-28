### SCRIPTS

`Map header` has a pointer to the events structure.

```
byte	Number of person events
byte	Number of warps
byte	Number of script tiles
byte	Number of signposts
word	Pointer to Person struct
word	Pointer to Warp struct
word	Pointer to Script Tile struct
word	Pointer to Signpost struct
```

Person events have a rather well documented structure thanks to A-Map. There is no end marker, as only the number indicated in `Event struct` gets read.

```
byte	Person event number
byte	Sprite
hword	Unknown, 0x0
hword	X axis
hword	Y axis
byte	Height
byte	Movement type
byte	Movement
byte	Unknown
byte	Trainer bit
byte	Unknown
hword	View radius
word	Script pointer
hword	Person ID
hword	Filler, 0x0
```

Warps have a different structure. There is no breaks or end marker for warp structures, as they only get read by the number indicated in the inital event structure.

```
hword	X axis
hword	Y axis
byte	Unknown
byte	Warp number
byte	Map
byte	Map bank
```

Script tile struct.

```
hword	X axis
hword	Y axis
hword	Height
hword	Variable
hword	Activation value
hword	Filler, 0x0
word	Script pointer
```

Signpost struct.

```
hword	X axis
hword	Y axis
byte	Height
byte	Signpost type
hword	Filler, 0x0
word	Script Pointer
```

### LEVEL SCRIPTS

### MAP HEADER

```
word	Pointer to map footer
word	Pointer to events
word	Pointer to level script
word	Pointer to connections
hword	Song
hword	Map index
byte	Map name
byte	Cave
byte	Weather
byte	Map type
byte	Filler, 0x0
byte	Filler, 0x0
byte	Show name
byte	Fight type
```

Each map header is 28 bytes long.

`Map name` reads off of the list of names.
`Map index` apparently doesn't really matter, have to double check.

### MAP FOOTER

```
word	Width
word	Height
word	Pointer to border data
word	Pointer to map data
word	Pointer to first tileset
word	Pointer to second tileset
```

### WILD POKEMON TABLES

There aren't pointers to these for some reason, each table seems to be right after another structure.

The structure for one Pokemon is as follows.
```
byte	Minimum level
byte	Maximum level
hword	Species
```
It's terminated by the encounter ratio as a byte, three bytes of 0s, and then a pointer to the first Pokemon in that table.

Grass has 12 entries, surfing has 5, fishing has 10, and rock smash has 5.

The first two entries of the fishing table is only accessable by the Old Rod, the next six are accessable by the Good Rod, and the final two are only used by the Super Rod.

### TRAINER

```
byte	0x0	Custom attacks and items bits, see below
byte	0x1	Trainer Class
byte	0x2	Music and Gender, see below
byte	0x3	Sprite
string	0x4-0xF Trainer name, terminated by FF
hword	0x10	Item 1
hword	0x12	Item 2
hword	0x14	Item 3
hword	0x16	Item 4
word	0x18	Double battle bit. 0x0 is default, 0x1 is double battle.
word	0x1C	AI intelligence. http://www.pokecommunity.com/showpost.php?p=8728848&postcount=6
word	0x20	Number of Pokemon in team.
word	0x24	Point to Pokemon data.
```
There are a handful of bitfields in the structure, the the only kind of hard ones to explain would be 0x0 and 0x2.
`00000010b` in the first byte means that the Pokemon have custom held items. `00000001b` enables custom movesets. They aren't mutually exclusive.

As for byte 0x2, `0XXXXXXXb` means that the Trainer is male. `1XXXXXXXb` means the Trainer is female. The Xs represet what song is played, so the highest song that can be played is 0x7F.

### TRAINER POKEMON

For a Pokemon with no custom moves enabled, this is the structure.

```
byte	0x0	IVs
byte	0x1	Filler, 0x0
byte	0x2	Level
byte	0x3	Filler, 0x0
hword	0x4	Species
hword	0x6	Held item, only read if the held item bit is enabled in the Trainer struct
```

If the custom moves bit is set, this is the structure used instead.

```
byte	0x0	IVs
byte	0x1	Filler, 0x0
byte	0x2	Level
byte	0x3	Filler, 0x0
hword	0x4	Species
hword	0x6	Held item, only read if the held item bit is enabled in the Trainer struct
hword	0x8	Attack 1
hword	0xA	Attack 2
hword	0xC	Attack 3
hword	0xE	Attack 4
```

### POKEMON EVS

EVs are only used when both the custom held item and custom attacks bits are set.

```
byte	0x0	Nature
byte	0x1	Filler, 0x0
byte	0x2	Filler, 0x0
byte	0x3	Filler, 0x0
byte	0x4	IVs
byte	0x5	HP EVs
byte	0x6	Attack EVs
byte	0x7	Defense EVs
byte	0x8	Speed EVs
byte	0x9	Special Attack EVs
byte	0xA	Special Defense EVs
byte	0xB	Pokeball
byte	0xC	Ability
byte	0xD	Filler, 0x0
byte	0xE	Filler, 0x0
byte	0xF	Filler, 0x0
```

### MOVESET BITFIELD

The movesets are arranged as so;
`XXXXXXXYYYYYYYYYb`
This is a half-word, and the Xs represent the level. The Ys represent the move that is to be learned at that level. Movesets are terminated by `0xFFFF`.
