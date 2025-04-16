.text
main: addi $2 $0 5
      syscall
      add $12 $0 $2
      addi $2 $0 5
      syscall
      add $14 $0 $2
      addi $8 $0 2
soma: add $4 $12 $14
dvs:  div $4 $8
      mfhi $16
      mflo $4
cond: beq $16 $0 prt
      addi $16 $0 5
prt:  addi $2 $0 1
      syscall
      addi $2 $0 11
      addi $4 $0 ','
      syscall
      addi $2 $0 1
      add $4 $0 $16
      syscall
fim:  addi $2 $0 10
      syscall