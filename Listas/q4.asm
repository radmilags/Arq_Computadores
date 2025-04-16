.text
main: addi $2 $0 5
      syscall
      addi $8 $0 2
mult: mul $9 $8 $2
      addi $2 $0 5
      syscall
      addi $10 $0 3
mult: mul $11 $10 $2
soma: add $4 $9 $11
      add $12 $8 $10
div:  div $4 $12
      mflo $4
      addi $2 $0 1
      syscall
      addi $2 $0 10
fim:  syscall