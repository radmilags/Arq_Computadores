.text
main: addi $2 $0 5
      syscall
      addi $8 $0 3600
      addi $9 $0 60
dvs:  div $2 $8
      mflo $11 # horas
      mfhi $10
      div $10 $9
      mflo $12 # minutos
      mfhi $13 # segundos
prt:  addi $2 $0 1
      add $4 $0 $11
      syscall
      addi $2 $0 11
      add $4 $0 58
      syscall
      addi $2 $0 1
      add $4 $0 $12
      syscall
      addi $2 $0 11
      add $4 $0 58
      syscall
      addi $2 $0 1
      add $4 $0 $13
      syscall
      addi $2 $0 10
fim:  syscall