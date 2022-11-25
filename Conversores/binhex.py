def bintohexa(n):
  tamanho = len(n)
  n1 = []
  for i in range(tamanho):
      n1.append(n[i])
  resto = tamanho%4
  tamanho = tamanho//4
  lista = []
  s = ""
  inicio = 0
  if resto!=0:
      for i in range(resto):
          s+= n[i]
          n1.remove(n1[i])
      lista.append(s)
      inicio += 1
      tamanho +=1
  s = ""
  identificador = 0
  for i in range(inicio, tamanho):
      for j in range(identificador, identificador+4):
          s += str(n1[j])
      lista.append(s)
      identificador+=4
      s = ""
  ans = ""
  for i in range(len(lista)):
    ans += verificahexa(lista[i])
  return ans
def verificahexa(n):
    if(int(n) == 0): return "0"
    elif(int(n) == 1): return "1"
    elif(int(n) == 10): return "2"
    elif(int(n) == 11): return "3"
    elif(int(n) == 100): return "4"
    elif(int(n) == 101): return "5"
    elif(int(n) == 110): return "6"
    elif(int(n) == 111): return "7"
    elif(int(n) == 1000): return "8"
    elif(int(n) == 1001): return "9"
    elif(int(n) == 1010): return "A"
    elif(int(n) == 1011): return "B"
    elif(int(n) == 1100): return "C"
    elif(int(n) == 1101): return "D"
    elif(int(n) == 1110): return "E"
    elif(int(n) == 1111): return "F"
