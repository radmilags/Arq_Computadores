.text
main: addi $2 $0 5
      syscall
mult: mul $4 $2 $2
      addi $2 $0 1
      syscall
      addi $2 $0 10
fim:  syscall