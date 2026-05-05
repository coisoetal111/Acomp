#Variaveis




.data

 N:  .byte 4
 Vetor: .word 32,5,78,2
 Res: .zero 4
.text

 la s0,Vetor
 la s6,Res
 li s1,0
 lb s2,N
 
 li s4,0


loop:
 
 lw s3,0(s0)
 add s4,s3,s4
 addi s0,s0,4
 
 addi s1,s1,1
 blt s1,s2,loop
 
 
 div s4,s4,s2
 sw  s4,0(s6)