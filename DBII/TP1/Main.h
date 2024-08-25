#ifndef MAIN_H
#define MAIN_H

#include <stdio.h>

#define MAX_NAME_LEN 20
#define BUFFER_SIZE 1024

// Definição da estrutura do arquivo table.dic
struct table {
    int id_arquivo;
    char nome_logico[20];
    char nome_fisico[20];
}; typedef struct table Tabela;

#endif // MAIN_H
