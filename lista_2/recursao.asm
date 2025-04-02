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
# int fatorial(int n) {
#	if (n == 0) return 1;
#	return (fatorial(n - 1) * n)
#}
fatorial:
	# Empilhar ra e a0
	addi sp, sp, -8
	sw ra, 0(sp)
	sw a0, 4(sp)
	# quando for o caso base
	beq a0, zero, retorna_1
	
	#atualiza o parametro
	addi a0, a0, -1
	jal fatorial
	
	retorna_2:
		#incremetar 0
		addi a0, a0, 1
		mul a1, a1, a0
		j ret_fat;
	retorna_1:
		#a1 = 1
		li a1 ,1
		#desmpilhar
	ret_fat:
		lw a0, 4(sp)
		lw ra, 0(sp)
		addi sp, sp, 8
		jr ra