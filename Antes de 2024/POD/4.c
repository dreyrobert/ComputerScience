#include <stdio.h>
#include <math.h>

int main() {
    char l;
    scanf("%s", &l);
    int n, d;
    scanf("%d", &n);
    scanf("%d", &d);

    int cal;

    switch(l) {
        case('+'):
            cal = n + d;
            break;
        case('-'):
            cal = n - d;
            break;
        case('/'):
            cal = n / d;
            break;
        case('*'):
            cal = n * d;
            break;
    }

    printf("%d\n", cal);
}