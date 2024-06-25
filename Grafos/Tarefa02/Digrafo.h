/*
 * Tarefa 04 - Grafeira Linhas Aereas
 *
 * GEN254 - Grafos - 2024/1
 *
 * Nome:      XXXX
 * Matricula: XXXX
 */

#ifndef DIGRAFO_H

#define DIGRAFO_H

#include "Aresta.h"
#include <vector>
#include <list>

class Digrafo {
public:
    Digrafo(int num_vertices);
    
    int num_vertices();
    int num_arestas();

    void insere_aresta(Aresta e);
    bool tem_aresta(Aresta e);
    Digrafo inverter();
    void Dijkstra(int origem, std::vector<int>& distancias, std::vector<int>& predecessores);
    void encontraCamViavel(int X, int M);
private:
    std::vector<std::list<Aresta> > lista_adj_;
    int num_vertices_;
    int num_arestas_;

    bool tem_vertice(int v);
};

#endif /* DIGRAFO_H */
