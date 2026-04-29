.data
cyan: .word 0x00ffff # Cyan
Row: .byte 4 # Init Row
Column: .byte 7 # Init Column
Size: .byte 12 # Number of Elements
Color: .byte 5 # Color
Palette: .word 0x000000, 0x0000ff, 0x00ff00, 0xff0000,
 .word 0xffffff, 0xffff00, 


LEDMatrixBase: .word LED_MATRIX_0_BASE
LEDMatrixDim: .half LED_MATRIX_0_SIZE
LEDMatrixWidth: .byte LED_MATRIX_0_WIDTH
LEDMatrixHeight: .byte LED_MATRIX_0_HEIGHT
.text
 ## REGION 1 – Loop preamble

 
 lb    x17,Size
 lw    x13,cyan
 
 
 la     x1,LEDMatrixBase
 lwu    x3,0(x1)
 lb     x6,Row
 lb     x7,Column
 lb     x8,Size
 lb     x9,Color
 la     x10,Palette
 lb     x14,LEDMatrixWidth
 slli   x9,x9,2
 add    x10,x10,x9
 lw     x10,0(x10)
 mul    x12,x6,x14
 add    x12,x12,x7
 slli   x12,x12,2
 add    x3,x3,x12
 ## Loop initialization - DO NOT CHANGE THE LINE BELLOW
 add x5, x0, x0
loop:
 ## REGION 3 - Iteration code
 
 
 sw     x10,0(x3)
 addi   x3,x3,140
 ## loop control - DO NOT CHANGE BELLOW THIS LINE
 addi x5, x5, 1
 blt x5, x17, loop # branch to ‘loop’ if x5 < x17