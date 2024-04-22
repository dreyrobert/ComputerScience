#include "Grafo.h"
#include "Aresta.h"
#include <iostream>

using namespace std;

Grafo::Grafo(int num_vertices) {
    lista_adj_.resize(num_vertices);

    num_vertices_ = num_vertices;
    num_arestas_ = 0;
}

int Grafo::num_vertices() {
    return num_vertices_;
}

int Grafo::num_arestas() {
    return num_arestas_;
}

bool Grafo::tem_aresta(Aresta e) {
    list<int>::iterator it;
    
    for(it = lista_adj_[e.v1].begin(); it != lista_adj_[e.v1].end(); ++it){
        if(*it == e.v2){
            return false;
        }
    }
    return true;
}

void Grafo::insere_aresta(Aresta e) {
    if (!tem_aresta(e) && (e.v1 != e.v2)) {
        lista_adj_[e.v1].push_front(e.v2);
        lista_adj_[e.v2].push_front(e.v1);

        num_arestas_++;
    }
}

void Grafo::remove_aresta(Aresta e) {
    if (tem_aresta(e)) {
        lista_adj_[e.v1].remove(e.v2);
        lista_adj_[e.v2].remove(e.v1);

        num_arestas_--;
    }
}

void Grafo::imprimir() {
    for (int i = 0; i < num_vertices_; i++) {
        cout << i << ":";

        list<int>::iterator it;
        for(it = lista_adj_[i].begin(); it != lista_adj_[i].end(); ++it){
            cout << " " << *it;
        }
        cout << "\n";
    }

    cout << "\n";
}

bool Grafo::eh_clique(const vector<int>& listaDeVertices) {
    for (size_t i = 0; i < listaDeVertices.size() - 1; ++i) {
        for (size_t j = i + 1; j < listaDeVertices.size(); ++j) {
            if (!tem_aresta(Aresta{listaDeVertices[i], listaDeVertices[j]})) {
                return false;
            }
        }
    }
    return true;
}

