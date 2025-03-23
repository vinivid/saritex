	.data
	.align 0
adar: .word 12, 24, 48, 0, -3, 7, 9, -21
	   #0, 4, 8,   12, 16, 20, 24, 28
	   # tam 8
	.text
	.align 2
	.globl main
main: 
	la s1, adar # Carregando o endereço do array no s1
	mv t0, zero # inicializando o iterador i
	mv t1, zero # inicializando a variavel acumuladora
	li s2, 28   # colocando s2 como a boundary
	acc_loop:
		add t3, s1, t0 # endereco do vetor indexado por t0
		lw t4, 0(t3)
		add t1, t4, t1
		
		# andando um passo
		addi t0, t0, 4
		ble t0, s2, acc_loop
	
	mv a0, t1
	li a7, 1
	ecall
	# fim do programa
	li a7, 10
	ecall 
	