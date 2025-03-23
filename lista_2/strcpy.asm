	.data
	.align 0
str_src: .asciz "Oi mae! Estou na USP"
str_dst: .space 24

	.text
	.align 2
	.globl main
main:
	la s0, str_src # s0 endereço do primeiro byte de src
	la s1, str_dst # s1 enderoco do primeiro byte de dst
	loop:
		lb t0, 0(s0) # t0 = mem(s0 + 0)
		sb t0, 0(s1) # mem(s1 + 0) = t0 
		addi s0, s0, 1 # avança o ponteiro da str src
		addi s1, s1, 1 # avanca o dst
		bne t0, zero, loop # step
		
	#imprimindo destino
	li a7, 4
	la a0, str_dst
	ecall
	
	#encerra program
	li a7, 10
	ecall
	