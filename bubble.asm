	.data 
	.align 0
	# é o array de valores a serem organizados, é um endereço na memoria
array: .word 7, 5, 2, 1, 1, 3, 4
	    #0, 4, 8, 12, 16, 20
	  
vir: .asciz ","	  
	  
	.align 2
max: .word 20
	
	.text
	.align 2
	.globl main
main:	
	#Colocando o max - 1 para checar no loop
	lw s1, max
	addi s1, s1, -1
	# Pega o endereço array
	la s2, array
	#t1 sera a registradora que representa o J
	# Os dois for serão representado por bubble_one e bubble_two,
	#  e serão quebrados após checar se i ou j são maiores que s1
	# t2 é a reg que sera salvo o valor da comparacao para o fim 
	# do loop
	#t0 sera a registradora que representa o I
	addi t0, zero, zero
	bubble_one:
		#t1 sera a registradora que representa o J
		addi t1, zero, s1 # j = max - 1
		bubble_two:
			addi t3, t1, -4 # t3 = j - 1
			addi t4, zero, t3(s2) # aux
			ble t4, t1(s2), end_bubble_two_if
				sw t1(s2), t1(t3) # arr[j - 1] = arr[j]
				sw t4, t1(s2) # arr[j] = aux
			#Fazendo o step do loop e checando se foi alem do limite
			end_bubble_two_if:
			addi t1, t1, -1 # j= j - 1
			addi t2, t1, + 1 # t2 = i + i
			bgt t1, t2, bubble_two
		addi t0, t0, 1
		blt t0, s1, bubble_one
	
	#Início do prin
	addi t0, zero, zero
	print_loop:
		addi a0, zero, t0()
		addi a7, zero, 1
		
