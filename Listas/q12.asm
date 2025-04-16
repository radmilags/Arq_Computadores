.text
main: addi $2 $0 5
      syscall
      add $12 $0 $2
      addi $2 $0 5
      syscall
      add $14 $0 $2
      addi $2 $0 5
      syscall
      add $16 $0 $2
      addi $8 $0 27
mtpl: sll $20 $12 1
      add $20 $20 $12
      sll $22 $14 3
      add $22 $22 $14
      sll $24 $16 4
      sub $24 $24 $16
soma: add $4 $20 $22
      add $4 $4 $24
dvs:  div $4 $8
      mflo $4
      addi $2 $0 1
      syscall
      addi $2 $0 10
fim:  syscall