.thumb

.include "scripts/script_main.asm"

rom_area  equ 0x08000000

; This file will be used for hooks, bug fixes, and repoints.

.org 0x2548EB
kengeon_ability_2:
  .byte 0x30

.org 0x7CF308
pointer_to_old_man_in_vitlier1:
  .word vitlier_old_man_face_right + rom_area

.org 0x839C20
pointer_to_old_man_in_vitlier2:
  .word vitlier_old_man_face_right + rom_area

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
