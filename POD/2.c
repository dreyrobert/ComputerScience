#include <stdio.h>
#include <math.h>

// Complexidade(d)
int main() {
    int n, d;
    scanf("%d", &n);
    scanf("%d", &d);

    int soma = 0;
    for (int i = 0; i < d; i++) {
        soma = soma + n;
    }

    printf("%d ", soma);
}