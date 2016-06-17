.thumb

.include "./defines/script_macros.asm"

vitlier_old_man_face_right:
lockall
spriteface 0x4 0x4
textcolor 0x0
msgbox 0x087245CC 0x4
closeonkeypress
applymovement 0xFF 0x08165B0E
waitmovement 0x0
releaseall
end
