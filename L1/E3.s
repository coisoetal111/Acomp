# Constants definition

# Data section
.data
line: .byte 9
purple: .word 0xEE82EE
LEDMatrixBase: .word LED_MATRIX_0_BASE
LEDMatrixDim: .half LED_MATRIX_0_SIZE
LEDMatrixWidth: .byte LED_MATRIX_0_WIDTH
LEDMatrixHeight: .byte LED_MATRIX_0_HEIGHT



.text
    
    lw     x6,purple
    la     x1,LEDMatrixBase
    lb     x11,LEDMatrixWidth 
    lb     x5,LEDMatrixHeight
    addi   x2,x0,2
    addi   x10,x0,4
    addi   x12,x0,12
    addi   x13,x0,8
    addi   x15,x0,-4
    addi   x16,x0,-8
    addi   x17,x0,-12
    addi   x24,x11,-1
    addi   x25,x5,-1
    div    x7,x24,x2
    div    x8,x25,x2
    mul    x9,x11,x8
    add    x9,x9,x7
    
    mul    x9,x9,x10
    lwu    x3,0(x1)
    add    x3,x3,x9
    mul    x18,x17,x11
    mul    x19,x16,x11
    mul    x20,x15,x11
    mul    x21,x10,x11
    mul    x22,x13,x11
    mul    x23,x12,x11
    add    x18,x18,x3
    add    x19,x19,x3
    add    x20,x20,x3
    add    x21,x21,x3
    add    x22,x22,x3
    add    x23,x23,x3    
   
loop:
    sw     x6,0(x3)
    sw     x6,4(x3)
    sw     x6,8(x3)
    sw     x6,12(x3)
    sw     x6,-4(x3)
    sw     x6,-8(x3)
    sw     x6,-12(x3)
    sw     x6,0(x18)
    sw     x6,0(x19)
    sw     x6,0(x20)
    sw     x6,0(x21)
    sw     x6,0(x22)
    sw     x6,0(x23)
   
RunAgain:
    j      loop
