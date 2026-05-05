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
li  s5,D_PAD_0_BASE


#Find them middles---------
srai t0,s1,1 #largura/2
srai t1,s2,1 #altura/2
sw t0,0(s4) #x
sw t1,4(s4) #y
#--------------------------

jal ra, ChangeLEDStatus

loop:

lw s6,0(s5)
andi s6,s6,1
lw s7,4(s5) 
andi s7,s7,1
lw s8,8(s5)
andi s8,s8,1 
lw s9,12(s5) 
andi s9,s9,1

#Press check-------
or t0, s6, s7
or t0, t0, s8
or t0, t0, s9
beq t0, zero, loop
#-----------------


li s3, BACKGROUND_COLOR
jal ra, ChangeLEDStatus


li t0,1

beq s6,t0,up
beq s7,t0,down
beq s8,t0,left
beq s9,t0,right

jal ra,ChangeLEDStatus
j loop

up:
 lw t0,4(s4)
 addi t0,t0,-1
 sw t0, 4(s4)
 j Draw
down:
 lw t0,4(s4)
 addi t0,t0,1
 sw t0, 4(s4)
 j Draw
right:
 lw t0,0(s4)
 addi t0,t0,1
 sw t0, 0(s4)
 j Draw
left:
 lw t0,0(s4)
 addi t0,t0,-1
 sw t0, 0(s4)
 j Draw

Draw:
 li s3, FOREGROUND_COLOR
 jal ra, ChangeLEDStatus
 j loop
ChangeLEDStatus:
 la t0,location
 lw t1,0(t0)
 lw t2,4(t0)
 mul t2,t2,s1
 add t1,t1,t2
 slli t1,t1,2
 add t1,t1,s0
 sw s3,0(t1)
 jr ra