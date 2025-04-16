.text
main: addi $2 $0 5
      syscall
      addi $8 $0 10
dvs:  div $2 $8 # LO é quociente, HI é resto
      mflo $9 
      mfhi $10 
      div $9 $8 
      mflo $12 
      mfhi $11 
      addi $2 $0 1
      add $4 $0 $12 # primeiro n°
      syscall
      add $4 $0 $11 # segundo n°
      syscall
      add $4 $0 $10 # terceiro n°
      syscall
      addi $2 $0 10
fim:  syscall