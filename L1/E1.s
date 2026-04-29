# Constants definition


# Data section
.data
a: .word 420
b: .dword 0x3e8
c: .half -500
d: .byte 140
AVG: .zero 8
four: .byte 4

.text

lw    x6,a
ld    x7,b
lh    x8,c
lh    x9,d
lb    x11,four
la    x10,AVG
add    x12,x6,x7
add    x12,x12,x8
add    x12,x12,x9
div    x12,x12,x11

sw    x12,0(x10)