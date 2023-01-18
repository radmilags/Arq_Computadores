.include "cenario1.asm"
.text

main: 	
	# parametros globais
	addi $22, $0, 11 # base do personagem
	addi $23, $0, 11 # altura do personagem
	mul $26 $22 $23 # area do personagem (base * altura)
	addi $26 $26 32768 # tamanho da tela
	addi $18, $0, 117 # x inicial
	addi $19, $0, 240 # y inicial
	addi $20, $0, 100 # x final. evite ultrapassar 127
	addi $21, $0, 15 # y final. evite ultrapassar 63
	
	# chamada de funcao para
	# guardar cenario e
	# personagem na memoria
	add $t2, $0, $26 # contador da iteracao
	add $t0 $0 $t2
	sll $t0 $t0 2
	addi $t0 $t0 0x10010000
	addi $t0 $t0 -4 # local a ser lido
	add $t8 $0 $t2
	sll $t8 $t8 2
	add $t8 $t8 $t0 # local a ser armazenado
	jal store
	
	# chamada de funcao para
	# carregar cenario na tela
	lui $t0, 0x1001 # local a ser escrito
	add $t8 $0 $26
	sll $t8 $t8 2
	add $t8 $t8 $t0 # local a ser lido
	addi $t2, $0, 0
	jal load
	
	add $18, $0, $18 # x inicial
	add $19, $0, $19 # y inicial
	add $20, $0, $20 # x final
	add $21, $0, $21 # y final. nÃƒÂ£o colocar acima de 61!!!
	add $22, $0, $22 # base
	add $23, $0, $23 # altura
	
# laco de repeticao para personagem na tela
animacao:
	beq  $18, $20, fimanimacao # comparacao de posicao
	
            # chamada de funcao para
	# carregar personagem na tela 
	addi $8 $0 32768 # endereco do inicio do personagem na memoria
	sll $8 $8 3 # 2 telas * 4 bits
	mul $17 $22 $23 # linhas * colunas do desenho
	sll $17 $17 2 
	add $8 $8 $17
	addi $8 $8 0x10010000 
	add $9, $0, $22 # base (colunas do desenho)
	add $10, $0, $23 # altura (linhas do desenho)
	add $11, $0, $18 # x
	add $12, $0, $19 # y
	jal personagem
	
	addi $8, $0, 25000 # taxa de tempo de espera
	jal timer

		
	add $9, $0, $22 # base (colunas do desenho)
	add $10, $0, $23 # altura (linhas do desenho)
	add $11, $0, $18 # x do canto superior esquerdo
	add $12, $0, $19 # y do canto superior esquerdo
	jal carregafundo
	
	addi $18, $18, 1 # variacao do movimento
	j animacao

fimanimacao:

	# chamada de funcao para
	# carregar personagem na tela 
	addi $8 $0 32768 # endereco do inicio do personagem na memoria
	sll $8 $8 3 # 2 telas * 4 bits
	mul $17 $22 $23 # linhas * colunas do desenho
	sll $17 $17 2 
	add $8 $8 $17
	addi $8 $8 0x10010000 
	add $9, $0, $22 # base (colunas do desenho)
	add $10, $0, $23 # altura (linhas do desenho)
	add $11, $0, $18 # x
	add $12, $0, $19 # y
	jal personagem
	
end:	addi $2, $0, 10 # encerra o programa
	syscall
	
# funcao para carregar cenario na tela
load:	lw $t1, 0($t8)
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	addi $t8, $t8, 4
	addi $t2, $t2, 1
	bne $t2, 32768, load
	jr $31
	
# funcao para guardar cenario e personagem na memoria	
store:	lw $t1, 0($t0)
	sw $t1, 0($t8)
	addi $t0, $t0, -4
	addi $t8, $t8, -4
	addi $t2, $t2, -1
	bne $t2, 0, store
	jr $31


# funcao para desenhar personagem na tela
# parametros da funcao:
	# endereco inicial: $8 
            # Largura do personagem: $9
            # altura do personagem: $10
            # Saber o x: $11
            # Saber o y: $12
personagem:  
            lui $15, 0x1001
	sll $11, $11, 2
            sll $12, $12, 9 
            add $15, $15, $11
            add $15, $15, $12 # posicao inicial a ser desenhada
            add $13, $0, $9 # largura 

laco1:	beq $10, $0, fimlaco1
laco2:	beq $9, $0, fimlaco2
	lw $14, 0($8) # local a ler
	sw $14, 0($15) # local a desenhar.
	addi $8, $8, 4 
	addi $15, $15, 4
	addi $9, $9, -1 # largura --
	j laco2
fimlaco2:    
	addi $15, $15, 512
	sll $16, $13, 2 
	sub $15, $15, $16
	add $9, $0, $13 # largura valor inicial
	addi $10, $10, -1 # altura --  
	j laco1  
fimlaco1: 
            jr $31
            
# funcao para carregar parte do cenÃƒÂ¡rio.
# parametros da funcao: 
            # Largura do personagem: $9
            # altura do personagem: $10
            # Saber o x: $11
            # Saber o y: $12
carregafundo:  
            lui $15, 0x1001
	    sll $11, $11, 2
            sll $12, $12, 9
            add $15, $15, $11
            add $15, $15, $12 # posicao inicial a ser desenhada
            add $13, $0, $9 # largura 
            
            lui $8, 0x1001 
            add $8, $8, $11
            add $8, $8, $12 # posicao inicial a ser desenhada
	    add $12, $0, $26
	    sll $12, $12, 2
	    add $8, $8, $12
	    
laco1.1:	beq $10, $0, fimlaco1.1
laco2.1:	beq $9, $0, fimlaco2.1
	lw $14, 0($8) # local a ler
	sw $14, 0($15) # local a desenhar.
	addi $8, $8, 4 
	addi $15, $15, 4
	addi $9, $9, -1 # largura --
	j laco2.1
fimlaco2.1:    
	addi $15, $15, 512
	addi $8, $8, 512
	sll $16, $13, 2 
	sub $8, $8, $16
	sub $15, $15, $16
	add $9, $0, $13 # largura valor inicial
	addi $10, $10, -1 # altura --  
	j laco1.1  
fimlaco1.1: 
            jr $31
	
# funcao para passar tempo.
# taxa de espera: $8          
timer:	
	beq $8, $0, fimtimer
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	addi $8, $8, -1
	j timer
	
fimtimer: 
	  jr $31
