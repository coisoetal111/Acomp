# Constants definition

# Data section
.data
line: .byte 9
yellow: .word 0xFFFF00
LEDMatrixBase: .word LED_MATRIX_0_BASE
LEDMatrixDim: .half LED_MATRIX_0_SIZE
LEDMatrixWidth: .byte LED_MATRIX_0_WIDTH
LEDMatrixHeight: .byte LED_MATRIX_0_HEIGHT

.text

.text
    
    lw     x6,yellow
    la     x1,LEDMatrixBase
    addi   x2,x0,2
 
    div    x4,x4,x2
    lwu    x3,0(x1)
loop:
    sw     x6,1736(x3)
    sw     x6,1740(x3)
    sw     x6,1744(x3)
    sw     x6,1748(x3)
    sw     x6,1752(x3)
    sw     x6,1756(x3)
    sw     x6,1760(x3)
   
RunAgain:
    j      loop
