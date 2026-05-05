.data

Base: .word LED_MATRIX_0_BASE	
Width: .byte LED_MATRIX_0_WIDTH	
Height: .byte LED_MATRIX_0_HEIGHT
BackgroundColor: .word 0x0000FF

.text

 li s0,LED_MATRIX_0_BASE
 lw s1,BackgroundColor
 li s4,LED_MATRIX_0_HEIGHT  #nlinhas
 li s5,LED_MATRIX_0_WIDTH   #ncolunas
 slli s6,s4,2
 slli s7,s5,2
 li s3,0  #coluna
loop_ext:
 li s2,0  #linha
 mv t0,s0
loop_int:
 sw s1,0(t0)
 add t0,s7,t0
 addi s2,s2,1
 blt s2,s4,loop_int  
# check loop_ext
 addi s0,s0,4
 addi s1,s1,-7
 addi s3,s3,1
 blt  s3,s5,loop_ext