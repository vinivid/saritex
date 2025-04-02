	.data
	.align 0
str_src: .asciz "Oi mae!!"
	.align 2
ptr: .word

	.text
	.align 2
	.globl main
main:
	la s0, str_src # endereço da string
	mv t0, zero # inicializando a variavel contadora
	
	# loop de contagem de quantidade de caracteres em uma string
	count_start:
		lb t1, 0(s0) # carregando o valor armazenado
		addi s0, s0, 1 # avança o ponteiro
		addi t0, t0, 1 # adiciona mais 1
		bne t1, zero, count_start # enquanto não for zero continuar contando
	
	mv a0, t0 # colocando como argumento da alocação dinamica o tamanho da string
	li a7, 9 # syscall de alocação dinamica
	ecall 
	
	# armazenando o valor alocado no ponteiro 
	la s2, ptr # carrega o lugar que ptr ta apontando
	sw a0, 0(s2) # escreve o ponteiro pro lugar que ptr representa
	# MESMO Q VC TENAHA PEGO A LABEL AINDA N REPRESENTA O VALOR
	lw s1, 0(s2) # agora vc tem o conteudo do ponteiro
	
	la s0, str_src # recarregando o valor da string
	cpy_str:
		lb t0, 0(s0) # carrega o valor de srt_src
		sb t0, 0(s1) # escreve em ptr
		addi s0, s0, 1 # avança str_Src
		addi s1, s1, 1 # avanca 
		bne t0, zero, cpy_str
	 
	# reccaregando o valor do ponteiro
	la s3, ptr
	lw a0, 0(s3)
	li a7, 4
	ecall
	
	# sair do programa
	li a7, 10
	ecall