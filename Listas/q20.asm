.text
main: addi $2 $0 5	# legenda: $23 dia, $24 mês, $25 ano
      syscall
      add $25 $0 $2
      addi $8 $0 19
      div $25 $8
      mfhi $22	# a
      addi $9 $0 100
      div $25 $9
      mflo $21 # b
      mfhi $20 # c
      addi $10 $0 4
      div $21 $10
      mflo $19 # d
      mfhi $18 # e
      addi $8 $0 8
      add $17 $21 $8
      addi $9 $0 25
      div $17 $17 $9 # f
      sub $16 $21 $17
      addi $8 $0 1
      add $16 $16 $8
      addi $9 $0 3
      div $16 $16 $9 # g
      addi $8 $0 19
      addi $9 $0 15
      mul $15 $8 $22
      add $15 $15 $21
      sub $15 $15 $19
      sub $15 $15 $16
      add $15 $15 $9
      addi $8 $0 30
      div $15 $8
      mfhi $15 # h
      div $20 $10
      mflo $14 # i
      mfhi $13 # k
      addi $8 $0 32
      addi $9 $0 2
      mul $10 $9 $18
      add $12 $8 $10
      mul $10 $9 $14
      add $12 $12 $10
      sub $12 $12 $15
      sub $12 $12 $13
      addi $8 $0 7
      div $12 $8
      mfhi $12 # L
      addi $8 $0 11
      addi $9 $0 22
      addi $10 $0 451
      mul $8 $8 $15
      mul $9 $9 $12
      add $11 $22 $8
      add $11 $11 $9
      div $11 $11 $10 # m
      addi $8 $0 7
      addi $9 $0 114
      addi $10 $0 31
      mul $8 $8 $11
      add $24 $15 $12
      sub $24 $24 $8
      add $24 $24 $9
      div $24 $10
      mflo $24 # mês
      mfhi $23
      addi $8 $0 1
      add $23 $23 $8 # dia
fil1: addi $8 $0 10
      slt $9 $23 $8
      beq $9 $0 day
      addi $2 $0 1
      addi $4 $0 0
      syscall
day:  addi $2 $0 1
      add $4 $0 $23
      syscall
c1:   addi $2 $0 11
      addi $4 $0 '/'
      syscall
fil2: slt $10 $24 $8
      beq $10 $0 mnth
      addi $2 $0 1
      addi $4 $0 0
      syscall
mnth: addi $2 $0 1
      add $4 $0 $24
      syscall
c2:   addi $2 $0 11
      addi $4 $0 '/'
      syscall
year: addi $2 $0 1
      add $4 $0 $25
      syscall
fim:  addi $2 $0 10
      syscall