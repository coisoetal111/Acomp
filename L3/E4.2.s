.equ FOREGROUND_COLOR, 0xffff00
.equ BACKGROUND_COLOR, 0x0

.data
location: .word 0, 0 # (x,y)
EdgeColor: .word 0xff0000

.text
li s0,LED_MATRIX_0_BASE
li s1,LED_MATRIX_0_WIDTH 
li s2,LED_MATRIX_0_HEIGHT
li s3,FOREGROUND_COLOR
la s4,location
li s5,D_PAD_0_BASE
li s10, BACKGROUND_COLOR


lw a1,EdgeColor
 
jal ra,CreateGamingBoard

mv a0,s1
mv a1,s2
mv a2,s4
jal FindThemMiddles

mv a0,s0
mv a1,s1
mv a2,s3
jal ChangeLEDStatus

loop:
#D Pad Check------------
mv a0,s5
jal GetDPad

lw s6,12(sp)
lw s7,8(sp)
lw s8,4(sp)
lw s9,0(sp)

addi sp,sp,16
#-----------------------



mv a0,s6
mv a1,s7
mv a2,s8
mv a3,s9
jal PressCheck



mv a0,s0
mv a1,s1
mv a2,s10
jal ChangeLEDStatus



mv a0,s6
mv a1,s7
mv a2,s8
mv a3,s9
mv a4,s4
mv a5,s3
addi sp,sp,-16
sd s0,0(sp)
sd s1,8(sp)
jal MovementCheck


j loop


CreateGamingBoard:
 
 li t0,LED_MATRIX_0_BASE
 li t1,LED_MATRIX_0_WIDTH
 li t2,LED_MATRIX_0_HEIGHT
  
 mul t1,t1,t2
 li t2,0
   
  li t0,LED_MATRIX_0_BASE 
  li t1,LED_MATRIX_0_WIDTH
  li t2,0
edgeloop1:
   sw a1,0(t0)
   addi t0,t0,4
   addi t2,t2,1
   blt t2,t1,edgeloop1
   
   li t2,LED_MATRIX_0_HEIGHT
   slli t1,t1,2
   li t3,0
   mv t4,t0
   addi t4,t4,-4
edgeloop2:
   sw a1,0(t0)
   sw a1,0(t4)
   add t0,t0,t1
   add t4,t4,t1
   addi t3,t3,1
   blt t3,t2,edgeloop2
   
  sub t4,t4,t1
  li t1,LED_MATRIX_0_WIDTH
  li t2,0
edgeloop3:
  sw a1,0(t4)
  addi t4,t4,-4
  addi t2,t2,1
  blt t2,t1,edgeloop3  
  
  ret 

FindThemMiddles:

srai t0,a0,1 #largura/2
srai t1,a1,1 #altura/2
sw t0,0(a2) #x
sw t1,4(a2) #y

ret
GetDPad:
addi sp,sp,-16

lw t0,0(a0)
andi t0,t0,1
sw t0,12(sp)

lw t0,4(a0) 
andi t0,t0,1
sw t0,8(sp)

lw t0,8(a0)
andi t0,t0,1
sw t0,4(sp) 

lw t0,12(a0) 
andi t0,t0,1
sw t0,0(sp)

ret

PressCheck:
or t0, a0, a1
or t0, t0, a2
or t0, t0, a3
beq t0, zero, loop

ret

MovementCheck:
li t0,1

beq a0,t0,up
beq a1,t0,down
beq a2,t0,left
beq a3,t0,right

Movret:
ret
up:
 li t1,1
 lw t0,4(a4)
 beq t1,t0,Draw
 addi t0,t0,-1
 sw t0, 4(a4)
 j Draw
down:
 li t1,LED_MATRIX_0_HEIGHT
 addi t1,t1,-2
 lw t0,4(a4)
 beq t1,t0,Draw
 addi t0,t0,1
 sw t0, 4(a4)
 j Draw
right:
 li t1,LED_MATRIX_0_WIDTH
 addi t1,t1,-2
 lw t0,0(a4)
 beq t1,t0,Draw
 addi t0,t0,1
 sw t0, 0(a4)
 j Draw
left:
 li t1,1
 lw t0,0(a4)
 beq t1,t0,Draw
 addi t0,t0,-1
 sw t0, 0(a4)
 j Draw
Draw:
 
 ld a0,0(sp)
 ld a1,8(sp)
 addi sp,sp,16

 addi sp,sp,-4
 sw ra,0(sp)   
 
 li a2, FOREGROUND_COLOR
 jal ChangeLEDStatus
 
 lw ra,0(sp)
 addi sp,sp,4
 
 j Movret
ChangeLEDStatus:
 la t0,location
 lw t1,0(t0)
 lw t2,4(t0)
 mul t2,t2,a1
 add t1,t1,t2
 slli t1,t1,2
 add t1,t1,a0
 sw a2,0(t1)
 ret