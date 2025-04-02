	.data
	.align 0
str_entrada: .asciz "Digite 1 numero: "
str_saida: .asciz "Fatorial calculado: "
	
	.text
	.align 2
	.globl main
main:
	# printando a entrada
	la a0, str_entrada
	li a7, 4
	ecall 
	
	# lendo um inteiro
	li a7, 5
	ecall
	
	# colocando o inteiro como argumento da função
	mv s0, a0
	
	# chamando a funcao fatorial
	jal fatorial
	
	# printando a mensagem de saida
	la a0, str_saida
	li a7, 4
	ecall
	
	# copiando para a registrado a0 para printar
	mv a0, a1
	li a7, 1
	ecall
	
	# fim do programa
	li a7, 10
	ecall
	
# Função fatorial
# a0: numero a ser calculado
# a1: valor calculado
fatorial:
	li a1, 1 
	# O bagulho do salvo é simplesmente q ele tem q ser igual no final da funcao
	# ent é só vc colocar ele na stack
	fat_start:
		beq a0, zero, sai_loop
		mul a1, a1, a0
		addi a0, a0, -1
		b fat_start
	sai_loop:
	
	jr ra
	