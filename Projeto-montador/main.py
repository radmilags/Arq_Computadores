import build

# entrada do código em assembly (nomedoARQUIVO.EXTENSAO, comando)
#with abre o arquivo e fecha, sem precisar do close

with open('entrada_assembly.txt', 'r') as arquivo_entrada:
    cod = arquivo_entrada.readlines()

# construção de assembly para hexadeicmal
cod = build.construtor(cod)

# saída do codigo já convertido em hexadecimal
with open('saida_hex.txt', 'w') as arquivo_saida:
    for i in cod:
        arquivo_saida.write(f'{i}\n')