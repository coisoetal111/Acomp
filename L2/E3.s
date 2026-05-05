#variaveis


.data

A: .word 4, -1


.text
 li s0,1
 
 la s1,A
 
 lw s2,4(s1) #A[i]
 lw s3,0(s1) #A[i-1]
 
 blt s2,s3,if
 
 j end
 
if:

 mv s4,s2 #tmp
 mv s2,s3
 mv s3,s4
 
end:
 sw s2,4(s1)
 sw s3,0(s1)
