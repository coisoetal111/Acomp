#variaveis


.data

A: .word 4, -1, 5, 3, -6, -6
N: .byte 6


.text
 lb s5,N     #N

 
loop_ext: 
 li s0,1    #i
 la s1,A
 li s6,0     #n_trocas
 
loop_int: 
 
 
 lw s2,4(s1) #A[i]
 lw s3,0(s1) #A[i-1]
 blt s2,s3,if
 
 j end
 
if:

 mv s4,s2 #tmp
 mv s2,s3
 mv s3,s4
 addi s6,s6,1
 sw s3,0(s1) #A[i-1]
 sw s2,4(s1) #A[i]
 
end:
 
 #Check for
 
 
 
 
 
 addi s0,s0,1 #i++
 addi s1,s1,4 #A++
 
 blt  s0,s5,loop_int
 bne  s6,zero,loop_ext
 
 #-----------------
 