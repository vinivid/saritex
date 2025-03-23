	.data
string1: .asciz "cor "
string2: .asciz "azul"
	.text
	.align 2
	.globl main
main:
	la a0, string1
	la a1, string2
	
	jal ra, strcat
	
	la a0, string1
	li, a7, 4
	ecall 
	
	li, a7, 10
	ecall

# a0 = string1, que sera o endereço de destino da string concatenada
# a1 = string2, string a ser colocada no final
strcat:
	#primeramente encontramos o endereço da string 1
	# para começar a concatenar
	# while *string1 != 0 {string1 = string1 + 1}
	find_zero_start:
		lb t0, 0(a0) #checando se a0 ja esta apontando para o valor zero
		beq t0, zero, find_zero_end
		
		addi a0, a0, 1 # indo para o proximo byte
		b find_zero_start
	find_zero_end:
	
	# escrever o resto a partir daquele endereço
	# do while *str2 != 0 {*string1 = *string2; str1++, str2 ++} 
	tcon_start:
		lb t0, 0(a1) # carregando char de str2
		sb t0, 0(a0) # escrevendo onde o 0 estava previamente
		beq t0, zero tcon_end
		
		addi a0, a0, 1
		addi a1, a1, 1
		b tcon_start
	tcon_end:
	ret 