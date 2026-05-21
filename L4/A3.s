.data

x: .word 1,2,12,101
N: .word 4
.text



la s0,x
lw s1,N
addi sp,sp,-12
sd s0,0(sp)
sw s1,8(sp)
jal MeanClamp
lw s1,0(sp)
addi sp,sp,12
j end


MeanClamp:
 addi sp,sp,-40
 sd a0,0(sp)
 sd a1,8(sp)
 sd t0,16(sp)
 sd t1,24(sp)
 sd t2,32(sp)
 
 ld a1,40(sp) #*x 
 lw a0,48(sp) #N
 li t0,0 #sum
 li t1,0 #i
 addi sp,sp,-20
 sd ra,12(sp)
 sw t0,8(sp)
 sw t1,4(sp)
MeanClamp_Loop:
 ld a1,60(sp)
 lw t2,0(a1)
 sw t2,0(sp)
 jal Clamp
 lw t2,0(sp) #Clamp(x[i])
 lw t0,8(sp) #sum
 lw t1,4(sp) 
 add t0,t0,t2 #sum+=Clamp(x[i]) 
 sw t0,8(sp) #sum
 addi t1,t1,1 # i++
 sw t1,4(sp)
 ld a1,60(sp) #x
 addi a1,a1,4
 sd a1,60(sp) #x
 lw a0,68(sp) #N
 blt t1,a0,MeanClamp_Loop
 ld ra,12(sp)
 addi sp,sp,20
 div t0,t0,a0
 sw t0,40(sp)
 
 ld a0,0(sp)
 ld a1,8(sp)
 ld t0,16(sp)
 ld t1,24(sp)
 ld t2,32(sp)
 addi sp,sp,40
 
 ret

Clamp:
 lw a0,0(sp)
 li t0,100
 li t2,10
 blt a0,t0,Clamp_Sec1
 li a0,100
 sw a0,0(sp)
 ret
Clamp_Sec1:
 blt a0,zero,Clamp_Zero
 bgt a0,t2,Clamp_Ten
 sw a0,0(sp)
 ret
Clamp_Zero:
 li a0,0
 sw a0,0(sp)
 ret
Clamp_Ten:
 li a0,10
 sw a0,0(sp)
 ret
end:nop