.include "cenario.asm"

.text

main: 	
  lui $t0, 0x1001
	lui $t8, 0x1003
	jal load
	
	# nota verde
	lui $t0, 0x1001
	lui $t7, 0x1002
	addi $t7, $t7, -32768
	lui $t8, 0x1003
	addi $t2, $0, 56 #pixels da nota
	addi $t4, $0, 7 #colunas da nota
	jal notaVerde
	
	# nota vermelha
	lui $t0, 0x1001
	lui $t7, 0x1002
	addi $t7, $t7, -32544
	lui $t8, 0x1003
	addi $t2, $0, 56 #pixels da nota
	addi $t4, $0, 7 #colunas da nota
	jal notaVermelha
	
	# nota amarela
	lui $t0, 0x1001
	lui $t7, 0x1002
	addi $t7, $t7, -32320
	lui $t8, 0x1003
	addi $t2, $0, 56 #pixels da nota
	addi $t4, $0, 7 #colunas da nota
	jal notaAmarela
	
	# nota azul
	lui $t0, 0x1001
	lui $t7, 0x1002
	addi $t7, $t7, -32096
	lui $t8, 0x1003
	addi $t2, $0, 56 #pixels da nota
	addi $t4, $0, 7 #colunas da nota
	jal notaAzul
	
	# nota laranja
	lui $t0, 0x1001
	lui $t7, 0x1002
	addi $t7, $t7, -31872
	lui $t8, 0x1003
	addi $t2, $0, 56 #pixels da nota
	addi $t4, $0, 7 #colunas da nota
	jal notaLaranja
	
fim:	addi $2, $0, 10
	syscall
