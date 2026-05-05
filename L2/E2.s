#----------------------------------------------------
#  PINTO SORT
#----------------------------------------------------
.equ NUM_ELEMS 7

.data
 vect: .word 6,-25,14,127,-31,43,17
 res: .zero 4
 
 
 .text
 
 la s5,res
 li s0,NUM_ELEMS
 la s1,vect
 li s3,0xFFFFFFFFFFFFFFFF
 li s4,0
 
loop:
 
 lw s2,0(s1)
 
 blt s2,s3,min
 addi s1,s1,4
 addi s4,s4,1
 
 blt  s4,s0,loop
 
 j end
min:
 
 mv s3,s2
 j loop
end:
 
 sw s3,0(s1)