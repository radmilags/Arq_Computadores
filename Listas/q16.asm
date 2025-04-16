.text
main: addi $2 $0 5
      syscall
      add $10 $0 $2
      addi $8 $0 2
      addi $2 $0 1
dvs:  div $10 $8
      mfhi $4
      beq $4 $0 par
imp:  addi $4 $0 -1
      syscall
      j fim
par:  addi $4 $0 0
      syscall
fim:  addi $2 $0 10
      syscall