#include <stdio.h>
#include "main.h"
#include "readFile.h"
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]){

    if (argc != 2) {
        printf("Uso: %s <nome_logico>\n", argv[0]);
        return 1;
    }

    char *nomeLogico = argv[1];

    FILE *tableFile = fopen("table.dic", "rb");
    if (!tableFile) {
        perror("Erro ao abrir o arquivo table.dic");
        return 1;
    }

    Tabela tabela;
    int encontrado = 0;

    while (fread(&tabela, sizeof(Tabela), 1, tableFile)) {
        if (strncmp(tabela.nome_logico, nomeLogico, 20) == 0) {
            encontrado = 1;
            break;
        }
    }

    fclose(tableFile);

    if (!encontrado) {
        printf("Tabela '%s' não encontrada.\n", nomeLogico);
        return 1;
    }

    FILE *attFile = fopen("att.dic", "rb");
    if (!attFile) {
        perror("Erro ao abrir o arquivo att.dic");
        return 1;
    }

    Atributo atributos[100];  
    int numAtributos = 0;
    int tamanhoRegistro = 0;

    while (fread(&atributos[numAtributos], sizeof(Atributo), 1, attFile)) {
        if (atributos[numAtributos].id_arquivo_att == tabela.id_arquivo) {
            tamanhoRegistro += atributos[numAtributos].tamanho;
            numAtributos++;
        }
    }

    fclose(attFile);

    // printf("Tamanho registro: %i\n", tamanhoRegistro);

    FILE *fisicoFile = fopen(tabela.nome_fisico, "rb");
    if (!fisicoFile) {
        perror("Erro ao abrir o arquivo fisico");
        return 1;
    }

    char *registro = malloc(tamanhoRegistro);

    while (fread(registro, tamanhoRegistro, 1, fisicoFile)) {
        char *posicao = registro;

        for (int i = 0; i < numAtributos; i++) {
            if (atributos[i].tipo == 'S') {
                char valorString[atributos[i].tamanho + 1];
                strncpy(valorString, posicao, atributos[i].tamanho);
                valorString[atributos[i].tamanho] = '\0';
                printf("%s: %s\n", atributos[i].nome_att, valorString);
            } else if (atributos[i].tipo == 'I') {
                int valorInt;
                memcpy(&valorInt, posicao, sizeof(int));
                printf("%s: %d\n", atributos[i].nome_att, valorInt);
            } else if (atributos[i].tipo == 'D') {
                double valorDouble;
                memcpy(&valorDouble, posicao, sizeof(double));
                printf("%s: %f\n", atributos[i].nome_att, valorDouble);
            }
            posicao += atributos[i].tamanho;
        }

        printf("\n");
    }

    free(registro);
    fclose(fisicoFile);

    return 0;
}
