.data
Niterations: .byte 7 # Number of loop iterations
cyan: .word 0x00ffff # Cyan

LEDMatrixBase: .word LED_MATRIX_0_BASE
LEDMatrixDim: .half LED_MATRIX_0_SIZE
LEDMatrixWidth: .byte LED_MATRIX_0_WIDTH
LEDMatrixHeight: .byte LED_MATRIX_0_HEIGHT
.text
 ## REGION 1 – Loop preamble
 ## (add your code here – only if needed)
 ## REGION 2 - Set the register x17 to the number of iterations of the loop
 ## (as defined by variable Niterations)
 
 lb    x17,Niterations
 addi  x17,x17,20
 ## Loop initialization - DO NOT CHANGE THE LINE BELLOW
 add x5, x0, x0
loop:
 ## REGION 3 - Iteration code
 lw     x13,cyan
 la     x1,LEDMatrixBase
 lwu    x3,0(x1)
 addi   x6,x0,144
 mul    x6,x6,x5
 add    x3,x3,x6
 sw     x13,0(x3)
  
 ## loop control - DO NOT CHANGE BELLOW THIS LINE
 addi x5, x5, 1
 blt x5, x17, loop # branch to ‘loop’ if x5 < x17