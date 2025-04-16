.text
main: addi $2 $0 5
      syscall
      addi $8 $0 10
dvs:  div $2 $8
      mfhi $10
      mflo $9
      div $9 $8
      mfhi $11
      mflo $9
      div $9 $8
      mfhi $12
      mflo $13
prt:  addi $2 $0 1
      add $4 $0 $10
      syscall
      addi $2 $0 11
      addi $4 $0 10
      syscall
      addi $2 $0 1
      add $4 $0 $11
      syscall
      addi $2 $0 11
      addi $4 $0 10
      syscall
      addi $2 $0 1
      add $4 $0 $12
      syscall
      addi $2 $0 11
      addi $4 $0 10
      syscall
      addi $2 $0 1
      add $4 $0 $13
      syscall
      addi $2 $0 10
fim:  syscall