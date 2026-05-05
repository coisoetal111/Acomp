.data

Base: .word LED_MATRIX_0_BASE	
Width: .byte LED_MATRIX_0_WIDTH	
Height: .byte LED_MATRIX_0_HEIGHT
BackgroundColor: .word 0x0000FF
Switch: .word SWITCHES_0_BASE
Step: .byte 0,1,0,-1
.text

 li s0,LED_MATRIX_0_BASE
 lw s1,BackgroundColor
 li s4,LED_MATRIX_0_HEIGHT  #nlinhas
 li s5,LED_MATRIX_0_WIDTH   #ncolunas
 li s3,SWITCHES_0_BASE
 
 li t1,1
 li t4,-1
 
 la t3,Step
 lw t6,0(s3)
 
#last led calc------------
 mul s7,s4,s5
 slli s7,s7,2
 add s2,s0,s7  #last led
#-------------------------
start: 
 sw zero,0(s0)
 mv t0,s0
 j frente
start2:
 sw zero,4(t0)
 mv t0,s2
 j ré
ré:

 sw s1,0(t0)
 sw zero,24(t0)
 addi t0,t0,-4
 
# check direction
 lw t2,0(s3)
 add t2,t2,t3
 lb t2,0(t2)
#----------------
 bne t2,t4,stop
 bgt t0,s0,ré
 j start2 
frente:
 sw s1,0(t0)
 sw zero,-4(t0)
 addi t0,t0,4


# check direction
 lw t2,0(s3)
 add t2,t2,t3
 lb t2,0(t2)
#----------------

 bne t2,t1,stop
 blt t0,s2,frente
 j stop

stop:
 # check direction
 lw t2,0(s3)
 add t2,t2,t3
 lb t2,0(t2)
#----------------   
 beq t2,t1,frente
 beq t2,t4,ré
 j stop