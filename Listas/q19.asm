.text
main: addi $2 $0 5
      syscall
mes:  addi $8 $0 1
      addi $9 $0 2
      addi $10 $0 3
      addi $11 $0 4
      addi $12 $0 5
      addi $13 $0 6
      addi $14 $0 7
      addi $15 $0 8
      addi $16 $0 9
      addi $17 $0 10
      addi $18 $0 11
      addi $19 $0 12
cdt:  beq $2 $8 tri
      beq $2 $10 tri
      beq $2 $12 tri
      beq $2 $14 tri
      beq $2 $15 tri
      beq $2 $17 tri
      beq $2 $19 tri
cd:   addi $2 $0 1
      addi $4 $0 30
      syscall
      j fim
tri:  addi $2 $0 1
      addi $4 $0 31
      syscall
fim:  addi $2 $0 10
      syscall