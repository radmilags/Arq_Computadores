import functions

# chamadas das funções
def construtor(codigos):
    codigos = functions.filtro(codigos)
    codigos = functions.separador(codigos)
    codigos = functions.operacao(codigos)
    codigosfinal = functions.saida(codigos)
    return codigosfinal