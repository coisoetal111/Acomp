.data

Base: .word LED_MATRIX_0_BASE	
Width: .byte LED_MATRIX_0_WIDTH	
Height: .byte LED_MATRIX_0_HEIGHT
BackgroundColor: .word 0x00FAFAFA

.text

 li s0,LED_MATRIX_0_BASE
 lw s1,BackgroundColor
 
loop:
 sw s1,0(s0) 
 addi s0,s0,4
 j loop  