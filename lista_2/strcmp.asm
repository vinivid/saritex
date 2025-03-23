	.data 
	.align 0
str1: .asciz "coisa"
str2: .asciz "coiso"

 	.text
 	.align 2
 	.globl main
main:
	# colocando os argumentos
	la a0, str1
	la a1, str2
	
	# comparando
	jal ra, strcmp
	
	# printando o se a comparaçãp
	mv a0, s0
	li a7, 1
	ecall
	
	#fim do programa
	li a7, 10
	ecall
	

# a0 = string1
# a1 = string2
# s2 = valor de retorno
strcmp:
	iter_start:
		lb t0, 0(a0)
		lb t1, 0(a1)
		# checando se alguma das strings acabou
		beq t0, zero, str_ended # não tem como só checar se ele não são iguais 
		beq t1, zero, str_ended # pq tem a chance do resto da memoria estar em zero
		
		xor t3, t0, t1 # se der zero significa q ambos são iguais
		bne t3, zero, char_unequal # a string não acabou mas os char são 
		# diferentes, logo ou vai dar maior que ou menor que
		
		# avançando no loop
		addi a0, a0, 1
		addi a1, a1, 1
		b iter_start		
	
	str_ended:
		beq t0, t1, return_zero # ambos os valores são iguais, as duas são iguais
		blt t0, t1, return_neg # string1 e menor q a string2
		b return_pos # string 2 e maior q string 1
	
	char_unequal:
		blt t0, t1, return_neg # string1 tinha um valor menor
		b return_pos # string1 tinha um valor maior
						
	return_zero:
		li s0, 0
		ret
	
	return_pos:
		li s0, 1
		ret
	
	return_neg:
		li s0, -1
		ret