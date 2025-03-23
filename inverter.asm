	.data
	.align 0
sty: .space 13
inver: .space 13

	.text
	.align 2
	.globl main
main:
	# lendo uma string
	la a0, sty #Primeiro argumento, enderço aonde deve ser armazenado a string
	li a1, 12 # Quantidade maxima de caracteres
	li a7, 8 # Syscal para ler uma string
	ecall
	
	jal ra, inverter
	
	mv a0, s0
	li a7, 4
	ecall 
	
	li a7, 10
	ecall
	
# a0 = endereço da string a ser invertida
inverter:
	la s0, inver # o endereço da string a ser invertida
	mv t0, zero # variavel contadora
	mv t1, a0 # uma copia do ponteiro de onde a string a0 aponta
	
	li s6, 10 # valor do line feed
	li s1, 12 # valor máximo da string
	count_start:
		beq t0, s1, count_exit 
		
		lb t2, 0(t1) # carregando o valor do char e comparando se é zero para dar break
		beq t2, s6, count_exit # se o valor for zero ele sai do loop
		addi t1, t1, 1 #proximo lugar na mem
		addi t0, t0, 1 #avancado o contador
		b count_start
	count_exit:
	
	# tudo foi contado, agora ir inversamente pelos endereco e copiando no inver
	addi t1, t1, -1 # voltando pq t1 eta apontando para o zero da string
	invert_start:
		beq t0, zero, invert_exit
		lb t3, 0(t1) # lendo o valor do char no index tal e escrevendo no oposto da inver
		sb t3, 0(s0)
		
		addi s0, s0, 1 # indo na frente com o inver
		addi t1, t1, -1 # indo atrás com sty
		addi t0, t0, -1 # reduzindo a variavel contadora
		b invert_start
	invert_exit:
	
	la s0, inver # carregando o resultado em s0
	ret 