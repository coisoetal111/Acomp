.data

FillColor: .word 0xFF


.text

lw a0,FillColor


FillMatrix:
    
 li t0,LED_MATRIX_0_BASE
 li t1,LED_MATRIX_0_WIDTH
 li t2,LED_MATRIX_0_HEIGHT
 mul t1,t1,t2
 li t2,0
loop:
 sw a0,0(t0)
 addi t0,t0,4
 addi t2,t2,1
 blt t2,t1,loop