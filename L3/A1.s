.data

x: .word 5
N: .word 4
v: .word 11,15,14,13
.text

lw a0,N
la a1,v
addi sp,sp,-16
jal OddSeq
 lw s0,12(sp) #V[0]
 lw s1,8(sp) #V[N-1]
 lw s2,4(sp) #avg
 lw s3,0(sp) #Max
 addi sp,sp,16

j end 

OddSeq:
 li a3,0 #i
 li a4,0 #sum
 lw s1,0(a1) #v (para dps ter o V[0])
 mv a5,a0 #N
 mv a6,a1 #v
 li s0,0 #Max
 addi sp,sp,-4
 sw ra,0(sp)
OddSeqLoop:
 lw a0,0(a6)
   
 jal Odd   
 sw a0,0(a6)
 add a4,a4,a0 #Sum
 blt a0,s0,OddSeqNotIf
 mv s0,a0
OddSeqNotIf:
 addi a6,a6,4
 addi a3,a3,1
 blt a3,a5,OddSeqLoop
 
 lw ra,0(sp)
 addi sp,sp,4
 mv a0,a4
 
 sw s1,12(sp) #V[0]
 lw s1,-4(a6)
 sw s1,8(sp) #V[N-1]
 div s1,a4,a5
 sw s1,4(sp) #avg
 sw s0,0(sp) #Max
 
 ret




Odd:
 li t0,2
 mv t1,a0
 rem t1,t1,t0
 beq t1,zero,NotOdd
 ret
NotOdd:
 addi a0,a0,1
 ret
 
end:
    nop