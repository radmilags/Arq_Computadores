.text
main: addi $2 $0 5
      syscall
      addi $8 $0 10
      div $2 $8
mod:  mfhi $10
quo:  mflo $9
      div $9 $8
mod:  mfhi $11
quo:  mflo $12
      add $4 $10 $11
soma: add $4 $4 $12
      addi $2 $0 1
      syscall
      addi $2 $0 10
fim:  syscall