.text
main:
	addi $2 $0 5
	syscall
mult: 
	mul $8 $2 $2
	add $4 $0 $8
	addi $2 $0 1
	syscall
fim:
	addi $2 $0 10
	syscall
