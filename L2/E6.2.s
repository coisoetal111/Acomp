.equ FOREGROUND_COLOR, 0xffff00
.equ BACKGROUND_COLOR, 0x0

.data
location: .word 0, 0 # (x,y)


.text
li s0,LED_MATRIX_0_BASE
li s1,LED_MATRIX_0_WIDTH 
li s2,LED_MATRIX_0_HEIGHT
li s3,FOREGROUND_COLOR
la s4,location
srai t0,s1,1 #largura/2
srai t1,s2,1 #altura/2
sw t0,0(s4) #x
sw t1,4(s4) #y




ChangeLEDStatus:
 la t0,location
 lw t1,0(t0)
 lw t2,4(t0)
 mul t2,t2,s1
 add t1,t1,t2
 slli t1,t1,2
 add t1,t1,s0
 sw s3,0(t1)
