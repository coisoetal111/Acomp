.data

RandState: .word 0
res: .zero 40

.text


li s1,0
li s2,10
la s3,res
loop:
jal rand
rem a0,a0,s2
sw a0,0(s3)
addi s3,s3,4
addi s1,s1,1
blt s1,s2,loop
j end





rand:
 la t0,RandState
 lwu t1,0(t0)
 
 li t2,1664525
 li t3,1013904223
 
 mul t1,t1,t2
 add t1,t1,t3
 
 sw t1,0(t0)
 
 srai t1,t1,16
 mv a0,t1
 ret
 
end:
nop