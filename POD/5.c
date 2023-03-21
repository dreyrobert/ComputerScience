#include <stdio.h>
#include <math.h>

int factorial(int n) {
    if ( n == 1) {
        return 1;
    }
    return n * factorial(n-1);
}
// Complexidade(n)
int main() {
    int n;
    scanf("%d", &n);

    printf("%d\n", factorial(n));
}