.text
main:
	addi $2 $0 5
	syscall
	add $8 $0 $2
	addi $2 $0 5
	syscall
soma:
	add $9 $8 $2
divisao:
	div $9 $9 2
	add $4 $0 $9
	addi $2 $0 1
	syscall
fim:
	addi $2 $0 10
	syscall