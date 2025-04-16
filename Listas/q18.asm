.text
main: addi $2 $0 5
      syscall
      add $12 $0 $2
      addi $2 $0 5
      syscall
      add $14 $0 $2
sbt:  sub $8 $12 $14
      srl $16 $8 31
      beq $16 $0 men
      add $4 $0 $12
      j prt
men:  add $4 $0 $14
prt:  addi $2 $0 1
      syscall
      addi $2 $0 10
fim:  syscall