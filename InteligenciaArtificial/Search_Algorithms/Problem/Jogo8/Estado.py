class Estado:
    def __init__(self, tamanho: int, branco: bool = False):
        self.tamanho = tamanho
        self.tabuleiro = [] if branco else self.criar_tabuleiro()
        self.vazio = self.tamanho ** 2 - 1

    def __str__(self):
        tabuleiro_str = " " + "____" * self.tamanho
        for i in range(self.tamanho):
            tabuleiro_str += "\n| "
            for j in range(self.tamanho):
                tabuleiro_str += str(self.tabuleiro[i * self.tamanho + j]) + " | "
        tabuleiro_str += "\n " + "----" * self.tamanho
        return tabuleiro_str

    def __eq__(self, estado: 'Estado') -> bool:
        if self.tamanho != estado.tamanho:
            return False
        for i in range(len(self.tabuleiro)):
            if self.tabuleiro[i] != estado.tabuleiro[i]:
                return False
        return True

    def __ne__(self, estado: 'Estado') -> bool:
        return not self.__eq__(estado)

    def criar_tabuleiro(self) -> list[int]:
        tabuleiro = []
        for i in range(1, self.tamanho**2):
            tabuleiro.append(i)
        tabuleiro.append(0)
        return tabuleiro
    
    def heuristica(self) -> int:
        distancia = 0
        for i in range(self.tamanho * self.tamanho):
            x_atual = i % self.tamanho
            y_atual = i // self.tamanho
            
            y_esperado= self.tabuleiro[i] % self.tamanho
            x_esperado = self.tabuleiro[i] // self.tamanho
            distancia += abs(x_atual - x_esperado) + abs(y_atual - y_esperado)
        return distancia
