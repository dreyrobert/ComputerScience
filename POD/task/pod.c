#include <stdio.h>
#include <stdbool.h>  

void troca(int *v, int *f) {
    int aux = *v;
    *v = *f;
    *f = aux;
}

int *bubbleSort(int *v, int lenght) {
    bool flag;
    for (int i = lenght-1; i > 0; i--) {
        flag = false;
        for (int j = 0; j < i; j++) {
            if (v[j] > v[j+1]) {
                troca(&v[j], &v[j+1]);
                flag = true;
            }
        }
        if ( flag == false ) {
            return v;
        } 
    }
    return v;
}

int main() {

    int vetor[] = {7, 10, -5, 8, 20, 100, 0};
    int lenght = sizeof(vetor)/sizeof(int);

    int *bubble = bubbleSort(vetor, lenght);

    for (int i = 0; i < lenght; i++) {
        printf("%d ", bubble[i]);
    }
    return 0;
}