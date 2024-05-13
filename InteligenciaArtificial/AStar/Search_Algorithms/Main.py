from Algorithm.BFS import BFS
from Algorithm.AStar import AStar
from Problem.Jogo8.Complexidade import Complexidade
from Problem.Jogo8.Jogo8 import Jogo8

instancia = Jogo8(3, Complexidade.Medio)
print(instancia.estado_inicial)
astar = AStar(instancia.estado_inicial, instancia.estado_final)
astar.encontrar_solucao()
print(f"Solucao Otima: {astar.solucao}")
print(f"Custo da S*: {len(astar.solucao)}")
print(f"Tempo de execucao: {astar.tempo_execucao:.2f}s")
print(f"Quantidade de estados analisados: {astar.estados_analisados}")
