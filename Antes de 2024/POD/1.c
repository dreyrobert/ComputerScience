#include <stdio.h>
#include <math.h>

// Complexidade(n)
int main() {
    int n;
    scanf("%d", &n);

    int metade = n/2;

    for (int i = 1; i <= n; i++) {
        printf("%d ", i);
        if ( i == round(metade) ) {
            printf("Metade ");
        }
    }
    return 0;
}