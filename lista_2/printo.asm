	.data
	.align 2
array: .word 1, 2, 3, 4

	.text
	.align 2
	.globl main
main:
	la a0, array
	lw a1, 4(a0)
	lw a2, 8(a0)
	add a3, a1, a2
	add a0, zero, a3
	addi a7, zero, 1
	ecall
	addi a7, zero, 10
	ecall