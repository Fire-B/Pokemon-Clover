.thumb

; This file will be used for hooks, bug fixes, and repoints.

.org 0x905360
clear_smog_battle_script_1:
  .byte 0x0

.org 0x905380
clear_smog_battle_script_2:
  .byte 0xA, 0x8A, 0x10 ; probably going to change this to battlescript macros when i get them to work properly.
  .hword 0x00F9
  .byte 0x12
  .hword 0x0040
  .byte 0x15, 0x28
  .word 0x081D6947

.close
