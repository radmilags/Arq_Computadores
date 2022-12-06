.text 
#imprimir de 1 até
main: 
	addi $8 $0 1 #$9 = i
	addi $10 $0 11 #$9 tem que ser menor que $10 = 11
laco:
	slt $9 $8 $10 #$9 vai receber o 1 ou 0
	beq $9 0 fim #se $9 for igual que 0 é falso e ele sai do laço
	
	#imprimir numero
	add $4 $0 $8
	addi $2 $0 1
	syscall
	
	#imprimir quebra de linha
	add $4 $0 '\n'
	addi $2 $0 11
	syscall
	
	add $8 $8 1
	j laco
fim: 
	addi $2 $0 10
