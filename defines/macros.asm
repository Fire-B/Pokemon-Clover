.macro increment, symbol
\symbol set \symbol + 1
.endmacro

.macro enum_start, value
__enum__ set value
.endmacro

.macro enum, symbol
\symbol equ __enum__
	increment __enum__
.endmacro
