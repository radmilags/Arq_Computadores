from numpy import binary_repr
from textwrap import wrap

def filtro(lista):
    lista = [i.strip(' \n') for i in lista]
    lista.remove('.text')
    lista[0] = lista[0].replace('main:	','')
    lista = [i.strip('\t') for i in lista]
    lista = [i.replace('$','') for i in lista]
    return lista

def separador(lista):
    for i in range(len(lista)):
        lista[i] = lista[i].split()
    return lista

def operacao(lista):
    listabin = []

    listaOps = [
        'add',
        'addi',
        'addiu',
        'addu',
        'and',
        'andi',
        'div',
        'divu',
        'mul',
        'mult',
        'multu',
        'nop',
        'nor',
        'or',
        'ori',
        'sll',
        'slt',
        'slti',
        'sltiu',
        'sltu',
        'sra',
        'srl',
        'sub',
        'subu',
        'syscall',
        'xor',
        'xori'
    ]

    patterns = [
        'special',
        'immediate',
        'immediate',
        'special',
        'special',
        'immediate',
        'hilo',
        'hilo',
        'mtpl',
        'hilo',
        'hilo',
        'noope',
        'special',
        'special',
        'immediate',
        'shift',
        'special',
        'immediate',
        'immediate',
        'special',
        'shift',
        'shift',
        'special',
        'special',
        'sys',
        'special',
        'immediate'
    ]

    opCodes = [
        '100000',
        '001000',
        '001001',
        '100001',
        '100100',
        '001100',
        '011010',
        '011011',
        '011100',
        '011000',
        '011001',
        '000000',
        '100111',
        '100101',
        '001101',
        '000000',
        '101010',
        '001010',
        '001011',
        '101011',
        '000011',
        '000010',
        '100010',
        '100011',
        '001100',
        '100110',
        '001110'
    ]

    for i in lista:
        if len(i) > 1:
            imm = False
            for j in range(len(listaOps)):
                if i[0] == listaOps[j] and patterns[j] == 'immediate':
                    imm = True
            i = decimalToBinary(i, imm)

    for item in lista:
        for j in range(len(listaOps)):
            if item[0] == listaOps[j]:
                if patterns[j] == 'special':
                    listabin.append('000000' + item[2] + item[3] + item[1] + '00000' + opCodes[j])
                elif patterns[j] == 'immediate':
                    listabin.append(opCodes[j] + item[2] + item[1] + item[3])
                elif patterns[j] == 'shift':
                    listabin.append('00000000000' + item[2] + item[1] + item[3] + opCodes[j])
                elif patterns[j] == 'hilo':
                    listabin.append('000000' + item[1] + item[2] + '0000000000' + opCodes[j])
                elif patterns[j] == 'mtpl':
                    listabin.append(opCodes[j] + item[2] + item[3] + item[1] + '00000' + '000010')
                elif patterns[j] == 'noope':
                    listabin.append('00000000000000000000000000000000')
                elif patterns[j] == 'sys':
                    listabin.append('00000000000000000000000000' + opCodes[j])
    return listabin

def saida(lista):
    listahex = []
    for i in lista:
        cut = wrap(i, 4)
        add = ''
        for j in cut:
            if int(j) > 0:
                add += str(hex(int(j, base=2)).strip('0x'))
            else:
                add += '0'
        listahex.append(add)
    return listahex

def decimalToBinary(lista, cond):
    if cond:
        lista[len(lista) - 1] = str(binary_repr(int(lista[len(lista) - 1]), width=16))
    else:
        lista[len(lista) - 1] = str(binary_repr(int(lista[len(lista) - 1]), width=5))

    for i in range(1, len(lista) - 1):
        binary = binary_repr(int(lista[i]), width=5)
        lista[i] = str(binary)
    return lista