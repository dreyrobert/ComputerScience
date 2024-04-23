#ifndef GRAFO_H

#define GRAFO_H
#include <vector>
#include <list>
#include "Aresta.h"

class Grafo {
public:
    Grafo(int num_vertices);
    
    int num_vertices();
    int num_arestas();
    bool tem_aresta(Aresta e);
    void insere_aresta(Aresta e);
    void remove_aresta(Aresta e);
    void imprimir();
    bool eh_clique(const std::vector<int>& listaDeVertices);
private:
    std::vector<std::list<int> > lista_adj_;
    int num_vertices_;
    int num_arestas_;
};

#endif /* GRAFO_H */
