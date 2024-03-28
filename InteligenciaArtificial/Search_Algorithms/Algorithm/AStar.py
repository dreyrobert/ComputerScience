import time

from Algorithm.Algorithm import Algorithm
from Problem.Jogo8.Estado import Estado
from Tree.Arvore import Arvore


class AStar(Algorithm):
    def __init__(self, estado_inicial: Estado, objetivo: Estado):
        super().__init__("A*", Arvore(estado_inicial), objetivo)

    def encontrar_solucao(self):
        inicio = time.time()
        analisar = [(self.arvore_busca, 0)]  # (nó, custo total)
        while True:
            # Se lista está vazia, instância não possui solução
            if not analisar:
                break
            # Retira nó com menor custo total
            analisar.sort(key=lambda x: x[1])
            arvore, _ = analisar.pop(0)
            self.estados_analisados += 1
            # Verifica se estado analisado é objetivo
            if not self.eh_objetivo(arvore.estado):
                analisar.extend(self.expandir_com_custo(arvore, self.objetivo))
            else:
                self.solucao = arvore.retornar_acoes()
                break
        fim = time.time()
        self.tempo_execucao = fim - inicio
