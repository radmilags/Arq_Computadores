.text
main: addi $2 $0 12
      syscall
      add $8 $0 $2
      addi $9 $0 32
qdl:  addi $2 $0 11
      addi $4 $0 10
      syscall
subt: sub $4 $8 $9
      addi $2 $0 11
      syscall
      addi $2 $0 10
fim:  syscall