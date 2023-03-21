#include <stdio.h>
#include <math.h>

// Complexidade(n)
int main() {
    int n;
    scanf("%d", &n);

    int soma = 0;
    for (int i = 0; i <= n; i++) {
        soma = soma + i;
    }

    printf("%d ", soma);
}