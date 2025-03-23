	.data
	.align 0
fat_de: .asciz "Digite um número: "
fat: .asciz "O fatorial de: "
eh: .asciz " eh "	

	.text
	.align 2
	.globl main
main: 
	# Imprimindo o digite um numer
	la a0, fat_de
	li a7, 4
	ecall
	# lendo input
	li a7, 5
	mv s0, a0 # salvando o valor lido
	mv t0, s0 #movendo o primeiro valor do fatorial, t0 ira acc
	li t1, 1
	
	# É um loop diferente do q eu tinha pensado
	# é só checar no inicio e pular sempre no final
	fat_loop:
		beq, t0, zero, end_program
		mul t1, t1, t0
		# dando o step do loop
		addi, t0, t0, -1
		j fat_loop	

end_program:
	#imprime a mensagem de resulatdo
	la a0
	
	# Imprimido o valor do fatorial calculado 
	mv a0, t1 # Colocando como argumento do print o valor de t1
	li a7, 1
	
	ecall
	li a7, 10
	ecall
	