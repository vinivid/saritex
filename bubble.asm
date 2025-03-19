	.data 
	.align 0
	# o array de valores a serem organizados, so um endereco na memoria
array: .word 7, 5, 2, 1, 1, 3, 4
	    #0, 4, 8, 12, 16, 20, 24
	  
vir: .asciz ","	  
	  
	.align 2
max: .word 24
	
	.text
	.align 2
	.globl main
main:	
	#Colocando o max - 1 para checar no loop
	lw s1, max
	# Pega o endereco array
	la s2, array
	#t1 sera a registradora que representa o J
	# Os dois for serao representado por bubble_one e bubble_two,
	#  e sera o quebrados apos checar se i ou j sao maiores que s1
	# t2 e a reg que sera salvo o valor da comparacao para o fim 
	# do loop
	#t0 sera a registradora que representa o I
	add t0, zero, zero
	bubble_one:
		#t1 sera a registradora que representa o J
		add t1, zero, s1 # j = max 
		bubble_two:
			addi t3, t1, -4 # t3 = j - 1
			add t4, s2, t3 # o endereço do elemento j - 1
			lw t3, 0(t4) # o valor do endereço de j - 1
			
			addi t6, t4, 4 # o endereço do elemento j
			lw t5, 0(t6) # o valor no endereço j
			
			ble t3, t5, end_bubble_two_if
				sw t5, 0(t4) # arr[j - 1] = arr[j]
				sw t3, 0(t6) # arr[j] = arr[j - 1]
			#Fazendo o step do loop e checando se foi alem do limite
			end_bubble_two_if:
			addi t1, t1, -4 # j= j - 1s
			bgt t1, t0, bubble_two
		addi t0, t0, 4
		ble t0, s1, bubble_one
	
	#Inicio do print
	add t0, zero, zero
	print_loop:
		add t1, t0, s2 # posição na memorioa do array
		lw a0, 0(t1) #Colocacando o valor do array em a0 e printando
		addi a7, zero, 1
		ecall 
		#printando um virgula
		la a0, vir
		addi a7, zero, 4
		ecall
		#fazendo o step do loop
		addi t0, t0, 4
		ble t0, s1, print_loop 
	
	#fim do código
	addi a7, zero, 10
	ecall