#variaveis



.data
 
 a: .word 20
 b: .half -14
 c: .byte 4
 res: .zero 4
 
 
 .text
 
 la t0,a
 
 lw t1,0(t0)
 lh t2,4(t0)
 lb t3,6(t0)
 
 mul t4,t1,t3 # a * c
 add t4,t4,t2 # (a * c) + b
 srai t4,t4,1 # ((a * c) + b)/2
 
 sw t4,7(t0)
 