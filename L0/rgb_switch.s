# Constants definition
.equ MaxColorIntensity, 0xff
.equ MASK_001,          0b00000001
.equ MASK_010,          0b00000010
.equ MASK_100,          0b00000100

# Data section
.data
LEDMatrixBase:    .word LED_MATRIX_0_BASE
LEDMatrixDim:     .half LED_MATRIX_0_SIZE
LEDMatrixWidth:   .byte LED_MATRIX_0_WIDTH
LEDMatrixHeight:  .byte LED_MATRIX_0_HEIGHT

SwitchesBase:     .word SWITCHES_0_BASE
SwitchesSize:     .byte SWITCHES_0_SIZE
SwitchesN:        .byte SWITCHES_0_N

# Code section
.text

    la     x1,SwitchesBase
    lw    x2,0(x1)
    la     x1,LEDMatrixBase
    lw    x3,0(x1)
loop:
    add    x8,x0,x0
    lb     x4,0(x2)
TestRed:
    andi   x5,x4,MASK_001
    beq    x5,x0,TestGreen
    addi   x5,x0,MaxColorIntensity
    add    x8,x5,x8
TestGreen:
    andi   x6,x4,MASK_010
    beq    x6,x0,TestBlue
    addi   x6,x0,MaxColorIntensity
    slli   x6,x6,8
    add    x8,x6,x8
TestBlue:
    andi   x7,x4,MASK_100
    beq    x7,x0,TurnONLed
    addi   x7,x0,MaxColorIntensity
    slli   x7,x7,16
    add    x8,x7,x8
TurnONLed:
    sw     x8,80(x3)
    sw     x8,4(x3)
RunAgain:
    j      loop
