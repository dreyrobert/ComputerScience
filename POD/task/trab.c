/**
 * @file robertdrey.c
 * @author Robert Biasoli Drey
 * @version 0.3
 * @date 2023-04-28
 *
 * @copyright Copyright (c) 2023
 *
 *
 * @brief Arquivo template para trabalho de Pesquisa e Ordenação.
 *
 *      Cada estudante deve implementar as funções conforme as assinaturas
 * abaixo e realizar as impressões dos vetores após a ordenação. Desta forma,
 * o(a) estudante deve implementar o trecho de código para impressão dos vetores
 * ordenados dentro da função `main` conforme o exemplo do Bubble Sort abaixo.
 *
 * Se necessário, declare e implemente funções auxiliares para realizar as
 * ordenações.
 *
 * Importante:Não altere as assinaturas dos métodos de ordenação!
 *
 * Caso o vetor não possa ser ordenado por algum método, imprima uma mensagem de
 * aviso e o vetor original.
 *
 * Atenção: Antes de entregar, conferir se dos dados de documentação no início
 * do arquivo estão preenchidos corretamente.
 *
 */
#include <stdio.h>
#include <stdbool.h>

void copia(int *A, int *v, int size);
void troca(int *v, int *f);
void intercala(int *A, int inicio, int meio, int fim);
int particiona(int *A, int inicio, int fim);
void criaHeap(int *A, int i, int size);
int maiorEl(int *A, int size);

void bubbleSort(int *A, int size);
void selectionSort(int *A, int size);
void insertionSort(int *A, int size);
void mergeSort(int *A, int inicio, int fim);
void quickSort(int *A, int inicio, int fim);
void heapSort(int *A, int size);
void countingSort(int *A, int size);
void radixSort(int *A, int size);
void countSort(int *A, int size, int pos);

int main(){

    int i;
    int vetor[] = {1, 22, 10, 38, 5, 7, 5};
    int tamanhoVetor = (int)sizeof(vetor)/sizeof(int);


    // bubble sort
    int bubbleVec[tamanhoVetor];
    copia(vetor, bubbleVec, tamanhoVetor);
    bubbleSort(bubbleVec, tamanhoVetor);
    printf("\nBubble sort: ");
    for (i = 0 ; i < tamanhoVetor ; i++)
        printf("%d ", bubbleVec[i]);
    printf("\n");

    // selection sort
    int selectionVec[tamanhoVetor];
    copia(vetor, selectionVec, tamanhoVetor);
    selectionSort(selectionVec, tamanhoVetor);
    printf("\nSelection sort: ");
    for (i = 0 ; i < tamanhoVetor ; i++)
        printf("%d ", selectionVec[i]);
    printf("\n");

    // insertion sort
    int insertionVec[tamanhoVetor];
    copia(vetor, insertionVec, tamanhoVetor);
    insertionSort(insertionVec, tamanhoVetor);
    printf("\nInsertion sort: ");
    for (i = 0 ; i < tamanhoVetor ; i++)
        printf("%d ", insertionVec[i]);
    printf("\n");

    // merge sort
    int mergeVec[tamanhoVetor];
    copia(vetor, mergeVec, tamanhoVetor);
    mergeSort(mergeVec, 0, tamanhoVetor-1);
    printf("\nMerge sort: ");
    for (i = 0 ; i < tamanhoVetor ; i++)
        printf("%d ", mergeVec[i]);
    printf("\n");

    // quick sort
    int quickVec[tamanhoVetor];
    copia(vetor, quickVec, tamanhoVetor);
    quickSort(quickVec, 0, tamanhoVetor-1);
    printf("\nQuick sort: ");
    for (i = 0 ; i < tamanhoVetor ; i++)
        printf("%d ", quickVec[i]);
    printf("\n");

    // heap sort
    int heapVec[tamanhoVetor];
    copia(vetor, heapVec, tamanhoVetor);
    heapSort(heapVec, tamanhoVetor);
    printf("\nHeap sort: ");
    for (i = 0 ; i < tamanhoVetor ; i++)
        printf("%d ", heapVec[i]);
    printf("\n");

    // counting sort
    int countingVec[tamanhoVetor];
    copia(vetor, countingVec, tamanhoVetor);
    countingSort(countingVec, tamanhoVetor);
    printf("\nCounting sort: ");
    for (i = 0 ; i < tamanhoVetor ; i++)
        printf("%d ", countingVec[i]);
    printf("\n");

    // radix sort
    int radixVec[tamanhoVetor];
    copia(vetor, radixVec, tamanhoVetor);
    radixSort(radixVec, tamanhoVetor);
    printf("\nRadix sort: ");
    for (i = 0 ; i < tamanhoVetor ; i++)
        printf("%d ", radixVec[i]);
    printf("\n");

    return 0;
}

void copia(int *A, int *V, int size){
    int i;
    for (i = 0 ; i < size ; i++)
        V[i] = A[i];
}

void troca(int *v, int *f) {
    int aux = *v;
    *v = *f;
    *f = aux;
}

void intercala(int *A, int inicio, int meio, int fim) {
    int aux[fim-inicio+1];
    int i = inicio;
    int j = meio + 1;
    int k = 0;

    while ( i <= meio && j <= fim ) {
        if (A[i] <= A[j]) {
            aux[k] = A[i];
            i++;
        }
        else {
            aux[k] = A[j];
            j++;
        }
        k++;
    }

    while ( i <= meio ) {
        aux[k] = A[i];
        k++;
        i++;
    }

    while ( j <= fim) {
        aux[k] = A[j];
        k++;
        j++;
    }

    for ( k = inicio; k <= fim; k++) {
        A[k] = aux[k-inicio];
    }
}

int particiona(int *A, int inicio, int fim) {
    int posPivo = fim;
    int k = inicio;

    for ( int i = inicio; i < fim; i++) {
        if ( A[i] <= A[posPivo] ) {
            troca(&A[i], &A[k]);
            k++;
        }
    }
    if ( A[k] > A[posPivo] ) {
        troca(&A[k], &A[posPivo]);
    }
    return posPivo;
}

void criaHeap(int *A, int i, int size) {
    int maior = i;
    int left = (2*i)+1;
    int right = (2*i)+2;

    if ( left < size && A[left] > A[i]) {
        maior = left;
    }
    if ( right < size && A[right] > A[maior]) {
        maior = right;
    }

    if ( maior != i ) {
        troca(&A[i], &A[maior]);
        criaHeap(A, maior, size);
    }
}

int maiorEl(int *A, int size) {
    int maior = A[0];
    for ( int i = 1; i < size; i++) {
        if (A[i] > maior) {
            maior = A[i];
        }
        if (A[i] < 0) {
            return -1;
        }
    }
    return maior;
}

void bubbleSort(int *A, int size) {
    bool flag;
    for (int i = size-1; i > 0; i--) {
        flag = false;
        for (int j = 0; j < i; j++) {
            if (A[j] > A[j+1]) {
                troca(&A[j], &A[j+1]);
                flag = true;
            }
        }
        if ( flag == false ) {
            return;
        } 
    }
    return;
}

void selectionSort(int *A, int size) {
    for (int i = 0; i < size-2; i++) {
        int *menor = &A[i];
        for (int j = i+1; j < size; j++) {
            if (*menor > A[j]) {
                menor = &A[j];
            }
        }
        troca(&A[i], menor);
    }
}

void insertionSort(int *A, int size) {
    int j, p, i;
    for (i = 1; i <= size-1; i++) {
        p = A[i];
        for (j = i; j > 0 && p < A[j-1]; j--) {
            A[j] = A[j-1];
        }
        A[j] = p;
    }
}

void mergeSort(int *A, int inicio, int fim) {
    if ( inicio < fim ) {
        int meio = (inicio + fim)/2;
        mergeSort(A, inicio, meio);
        mergeSort(A, meio+1, fim);
        intercala(A, inicio, meio, fim);
    }
}

void quickSort(int *A, int inicio, int fim) {
    if ( inicio < fim ) {
        int posPivo = particiona(A, inicio, fim);
        quickSort(A, inicio, posPivo-1);
        quickSort(A, posPivo+1, fim);
    }
}

void heapSort(int *A, int size) {
    for ( int k = (size/2)-1; k >= 0; k--) {
        criaHeap(A, k, size);
    }

    for ( int k = size-1; k >= 1; k--) {
        troca(&A[0], &A[k]);
        criaHeap(A, 0, k);
    }
}

void countingSort(int *A, int size) {
    int k = maiorEl(A, size);
    if ( k < 0 ) {
        printf("\nN]ao é possivel ordenar números negativos.");
        return;
    }
    int count[k+1];
    int aux[size];

    for (int i = 0; i <= k; i++) {
        count[i] = 0;
    }

    for (int i = 0; i < size; i++) {
        count[A[i]]++;
    }

    for (int i = 1; i <= k; i++) {
        count[i] += count[i-1];
    }

    for (int i = size-1; i >= 0; i--) {
        count[A[i]] = count[A[i]] - 1;
        aux[count[A[i]]] = A[i];
    }

    for (int i = 0; i < size; i++) {
        A[i] = aux[i];
    }
}

void radixSort(int *A, int size) {
    int max = maiorEl(A, size);
    if ( max < 0 ) {
        printf("\nN]ao é possivel ordenar números negativos.");
        return;
    }
    for (int pos = 1; (max/pos) > 0; pos *= 10) {
        countSort(A, size, pos);
    } 
}

void countSort(int *A, int size, int pos) {
    int aux[size];
    int count[10];
    for (int i = 0; i < 10; i++) {
        count[i] = 0;
    }


    for (int i = 0; i < size; i++) {
        int digito = (A[i]/pos)%10;
        count[digito]++;
    }

    for (int i = 1; i < 10; i++) {
        count[i] += count[i-1];
    }

    for ( int i = size-1; i >= 0; i--) {
        int digito = (A[i]/pos) % 10;
        count[digito]--;
        aux[count[digito]] = A[i];
    }

    for ( int i = 0; i < size; i++ ) {
        A[i] = aux[i];
    }
} 