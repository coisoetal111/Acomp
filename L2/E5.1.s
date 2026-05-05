.data

Base: .word LED_MATRIX_0_BASE	
Width: .byte LED_MATRIX_0_WIDTH	
Height: .byte LED_MATRIX_0_HEIGHT
BackgroundColor: .word 0x0000FF
Switch: .word SWITCHES_0_BASE
.text

 li s0,LED_MATRIX_0_BASE
 lw s1,BackgroundColor
 li s4,LED_MATRIX_0_HEIGHT  #nlinhas
 li s5,LED_MATRIX_0_WIDTH   #ncolunas
 li s3,SWITCHES_0_BASE
 lw t2,0(s3)
 li t1,1
 mul s7,s4,s5
 slli s7,s7,2
 add s2,s0,s7
start: 
 sw zero,-4(t0)
 mv t0,s0
 
loop:
 sw s1,0(t0)
 sw zero,-4(t0)
 addi t0,t0,4
 bne t2,t1,stop
 blt t0,s2,loop
 j start
   
# check loop_ext

stop:
 lw t2,0(s3)   
 bne t2,t1,stop
 j loop