# Constants definition

# Data section
.data
line: .byte 9
color: .word 0x00FF00
black: .word 0
LEDMatrixBase: .word LED_MATRIX_0_BASE
LEDMatrixDim: .half LED_MATRIX_0_SIZE
LEDMatrixWidth: .byte LED_MATRIX_0_WIDTH
LEDMatrixHeight: .byte LED_MATRIX_0_HEIGHT

SwitchesBase:     .word SWITCHES_0_BASE
SwitchesSize:     .byte SWITCHES_0_SIZE
SwitchesN:        .byte SWITCHES_0_N


.text
    
    lw     x8,color
    lw     x13,black
    la     x1,LEDMatrixBase
    lwu    x3,0(x1)
    la     x1,SwitchesBase
    lwu    x4,0(x1)
    
loop:
    la     x1,SwitchesBase
    lwu    x4,0(x1)
    
    

    
    lw     x5,0(x4)
    add    x7,x0,x5
    andi   x7,x7,0xF #coluna
    srli   x5,x5,4
    add    x6,x0,x5
    srli   x6,x6,4   #switch
    
    add    x12,x0,x11
    bne    x11,x12,apagar
    beq    x6, zero, Stop
   
   
    andi   x5,x5,0xF #linha
    slli   x9, x7, 4      
    add    x9, x9, x5     
    slli   x9, x9, 2   
    
    add    x11, x3, x9
   
     
 
    bne    x11,x12,apagar
    
   
RunAgain:
    sw     x8,0(x11)
    add    x12,x0,x11
    j      loop
    
Stop:
 
    sw     x13,0(x11)
     
    j     loop

apagar: 
    sw     x13,0(x12)
    j    loop