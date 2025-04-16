.text
main: addi $2 $0 5
      syscall
      add $10 $0 $2
      addi $8 $0 10
      addi $2 $0 11
dvs:  div $10 $8
      mfhi $16
      mflo $9
      div $9 $8
      mfhi $15
      mflo $9
      div $9 $8
      mfhi $14
      mflo $13
c1:   beq $13 $0 s1
      addi $2 $0 1
      add $4 $0 $13
      syscall
c2:   beq $14 $0 s2
      addi $2 $0 1
      add $4 $0 $14
      syscall
c3:   beq $15 $0 s3
      addi $2 $0 1
      add $4 $0 $15
      syscall
c4:   beq $16 $0 s4
      addi $2 $0 1
      add $4 $0 $16
      syscall
      j fim
s1:   addi $2 $0 11
      addi $4 $0 ' '
      syscall
      j c2
s2:   addi $2 $0 11
      addi $4 $0 ' '
      syscall
      j c3
s3:   addi $2 $0 11
      addi $4 $0 ' '
      syscall
      j c4
s4:   addi $2 $0 11
      addi $4 $0 ' '
      syscall
fim:  addi $2 $0 10
      syscall