## Robert Biasoli Drey - matricula 2211100013
import math

def funcao(x):
    return math.sin(x*x)

def calcular_delta_xi(final, inicial, intervalo):
    return (final - inicial) / intervalo

def ci(xi_anterior, xi):
    return (xi_anterior + xi) / 2

def main():
    print("Expressão escolhida: sen(x^2)")
    print()

    inicio = float(input("Digite o número de inicio do intervalo: "))
    fim = float(input("Digite o número de fim do intervalo: "))
    subintervalo = int(input("Digite o número de subintervalos: "))

    delta = calcular_delta_xi(fim, inicio, subintervalo)
    
    area = 0
    xi_anterior = inicio
    for i in range(1, subintervalo + 1):
        xi = inicio + i * delta
        ci_atual = ci(xi_anterior, xi)
        area += delta * funcao(ci_atual)
        xi_anterior = xi

    print()
    print("A= ", abs(area))

main()
