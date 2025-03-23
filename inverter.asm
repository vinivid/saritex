	.data
	.align 0
sty: .space 12

	.text
	.align 2
	.globl main
main:
	# lendo uma string
	la a0, sty
	li a1, 12
	li a7, 8 
	

inverter: