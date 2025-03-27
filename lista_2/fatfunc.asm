	.data 
	.text
	.align 2
	.globl main
main:
	#lendo um inteiro
	li a7, 5
	ecall
	
	# chamando a função fatorial
	jal ra, fat
	
	# printando o vlaor calculado
	li a7, 1
	ecall
	
	#terminando o pwrograma
	li a7, 10
	ecall

# Calcula o valor do fatorial de um número
#positivo dado por a0
# a0 = inteiro positivo a ser calculado o fatorial
# retorno a0 - valor calculado
# se a0 for menor ou igual a zero retorna 1
fat:
	ble a0, zero, ltzero # se o valor dado como argumento for menor ou igual a 0 retorna 1

	li t1, 1 # registradora que ira acumular o valor final do fatorial 
	li t2, 1 # variavel contadora
	fat_loop: # while (t2 <= a0) {t1 = t1 * t2; t2 = t2 + 1}
		bgt t2, a0, fat_exit
		mul t1, t1, t2
		addi t2, t2, 1
		b fat_loop
		
	fat_exit:		
		
	mv a0, t1 # colocando o valor de retorno
	ret
	
	ltzero: 
		li a0, 1
		ret