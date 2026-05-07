

.data


.text

li s0,LED_MATRIX_0_BASE
li s1,LED_MATRIX_0_WIDTH
li s2,0xFF
li s3,LED_MATRIX_0_HEIGHT
slli s1,s1,2
addi s1,s1,4
div s4,s2,s3
slli s4,s4,16
sub s4,zero,s4
li t0,0
li s2,0xFF0000
loop:
 sw s2,0(s0)
 add s0,s0,s1
 add s2,s2,s4
 addi t0,t0,1
 blt t0,s3,loop