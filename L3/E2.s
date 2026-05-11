.data

FillColor: .word 0xff
EdgeColor: .word 0xff0000

.text


 lw a0,FillColor
 lw a1,EdgeColor
 
 jal ra,CreateGamingBoard
 j end
 
CreateGamingBoard:
 
  li t0,LED_MATRIX_0_BASE
  li t1,LED_MATRIX_0_WIDTH
  li t2,LED_MATRIX_0_HEIGHT
  
  mul t1,t1,t2
  li t2,0
loop1:
   
   sw a0,0(t0)
   addi t0,t0,4
   addi t2,t2,1
   blt t2,t1,loop1
   
  li t0,LED_MATRIX_0_BASE 
  li t1,LED_MATRIX_0_WIDTH
  li t2,0
loop2:
   sw a1,0(t0)
   addi t0,t0,4
   addi t2,t2,1
   blt t2,t1,loop2
   
   li t2,LED_MATRIX_0_HEIGHT
   slli t1,t1,2
   li t3,0
   mv t4,t0
   addi t4,t4,-4
loop3:
   sw a1,0(t0)
   sw a1,0(t4)
   add t0,t0,t1
   add t4,t4,t1
   addi t3,t3,1
   blt t3,t2,loop3
   
  sub t4,t4,t1
  li t1,LED_MATRIX_0_WIDTH
  li t2,0
loop4:
  sw a1,0(t4)
  addi t4,t4,-4
  addi t2,t2,1
  blt t2,t1,loop4  
  
  ret 
end:
 nop