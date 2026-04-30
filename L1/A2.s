#variaveis



.data
 
LEDMatrixBase:    .word LED_MATRIX_0_BASE
LEDMatrixDim:     .half LED_MATRIX_0_SIZE
LEDMatrixWidth:   .byte LED_MATRIX_0_WIDTH
LEDMatrixHeight:  .byte LED_MATRIX_0_HEIGHT
Cor1: .word 0xFF0000
Cor2: .word 0x0000FF

 

 .text
 
 la t0,LEDMatrixBase
 
 
 
 
 lwu t1,0(t0)  #Base / 1ºled
 lbu t2,6(t0)  #Width
 lbu t3,7(t0)  #Height
 
 slli s3,t2,2
 
 addi t5,t1,4  #2ºled
 add  s0,t1,s3  
 addi s0,s0,-4 #4ºled
 addi t6,s0,-4 #3ºled
 
 la   s1,Cor1
 lw   s2,4(s1) #Cor2
 lw   s1,0(s1) #Cor1
 
 
 li s4,0
 
 
loop:
 
 sw s1,0(t1)
 sw s1,0(t5)
 sw s2,0(t6)
 sw s2,0(s0)
 
 add t1,t1,s3
 add t5,t5,s3
 add t6,t6,s3
 add s0,s0,s3
 
 addi s4,s4,1
 
 ble s4,t3,loop