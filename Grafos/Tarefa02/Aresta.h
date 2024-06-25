/*
 * Tarefa 04 - Grafeira Linhas Aereas
 *
 * GEN254 - Grafos - 2024/1
 *
 * Nome:      Robert Biasoli Drey
 * Matricula: 2211100013
 */

#ifndef ARESTA_H

#define ARESTA_H

class Aresta {
public:
    Aresta(int v1, int v2, int peso);
    const int v1, v2, peso;
};

#endif /* ARESTA_H */