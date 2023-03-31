/**
 * @file nome_do_arquivo.c
 * @author Nome_do_Aluno
 * @version 0.3
 * @date 2023-03-30
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
void bubbleSort(int *v, int lenght);
void selectionSort(int *A, int size);
void insertionSort(int *A, int size);
// void mergeSort(int *A, int size);
// void quickSort(int *A, int size);
// void heapSort(int *A, int size);
// void countingSort(int *A, int size);
// void radixSort(int *A, int size);

int main(){

    int i;
    int vetor[] = {1, 22, -10, 38, 5, 7};
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

    // quick sort

    // heap sort

    // counting sort

    // radix sort

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

void bubbleSort(int *v, int lenght) {
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
    for (int i = 1; i < size-1; i++) {
        int p = A[i];
        int w = 0;
        for (int j = i; j >= 1 && p < A[j-1]; j--) {
            A[j] = A[j-1];
            w = j;
        }
        A[w] = p;
    }
}