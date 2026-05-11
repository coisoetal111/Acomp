.data

RandState: .word 0


.text

jal rand
j end

rand:
 la t0,RandState
 lw t1,0(t0)
 
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