from pulp import *
from extra import *
import itertools

caminho = "./instancias_problema_rotulos"
arquivo = "/inst5.in"

problema = open(caminho+arquivo, "r")

num_rotulos = 0

linhas = problema.readlines()

num_rotulos = int(linhas[0])

retangulos = []
for i in range(1, len(linhas)):
    linha = linhas[i].split(' ')
    retangulos.append(Retangulo(num = int(linha[0]), xb_coord= float(linha[1]), yb_coord= float(linha[2]), xt_coord= float(linha[3]), yt_coord= float(linha[4])))

x = LpVariable.dicts("x", range(num_rotulos), 0, 1, LpInteger)

modelo = LpProblem("Problema do Rotulos", LpMaximize)

modelo += (lpSum([x[i] for i in range(num_rotulos)]), "Funcao objetivo")

permutacao = itertools.permutations(retangulos, 2)

for p1,p2 in permutacao:
    sobreposicao = Retangulo.sobreposicao(p1, p2)
    if (sobreposicao == True):
        modelo += (x[p1.num-1] + x[p2.num-1] <= 1, f"Restricao de intersecao dos rotulos {x[p1.num-1]} e {x[p2.num-1]}")

modelo.solve()

