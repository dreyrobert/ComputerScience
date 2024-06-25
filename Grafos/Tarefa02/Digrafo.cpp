/*
 * Tarefa 04 - Grafeira Linhas Aereas
 *
 * GEN254 - Grafos - 2024/1
 *
 * Nome:      XXXX
 * Matricula: XXXX
 */

#include "Digrafo.h"
#include "Filapri_min.h"
#include <exception>
#include <stdexcept>
#include <algorithm>
#include <string>
#include <iostream>
#include <vector>
#include <limits.h>

using namespace std;

Digrafo::Digrafo(int num_vertices) {
    lista_adj_.resize(num_vertices);

    num_vertices_ = num_vertices;
    num_arestas_ = 0;
}

int Digrafo::num_vertices() {
    return num_vertices_;
}

int Digrafo::num_arestas() {
    return num_arestas_;
}

bool Digrafo::tem_vertice(int v) {
    return (v >= 0 && v < num_vertices_);
}

bool Digrafo::tem_aresta(Aresta e) {
    for (const Aresta& a : lista_adj_[e.v1]) {
        if (a.v2 == e.v2) {
            return true;
        }
    }

    return false;
}

void Digrafo::insere_aresta(Aresta e) {
    if (!tem_aresta(e)) {
        lista_adj_[e.v1].push_back(e);

        num_arestas_++;
    }
}

Digrafo Digrafo::inverter() {
    Digrafo invertido(num_vertices_);

    for (int v = 0; v < num_vertices_; v++) {
        for (const Aresta& a : lista_adj_[v]) {
            invertido.insere_aresta(Aresta(a.v2, a.v1, a.peso));
        }
    }

    return invertido;
}

void Digrafo::Dijkstra(int origem, std::vector<int>& distancias, std::vector<int>& predecessores) {
    int n = num_vertices_;
    distancias.resize(n, INT_MAX);
    predecessores.resize(n, -1);
    distancias[origem] = 0;

    Filapri_min<int> fila(n);

    fila.insere(origem, 0);

    while (!fila.vazia()) {
        int u = fila.remove().first;

        for (const Aresta& a : lista_adj_[u]) {
            int v = a.v2;
            float peso = a.peso;

            if (distancias[v] > distancias[u] + peso) {
                distancias[v] = distancias[u] + peso;
                predecessores[v] = u;

                if (fila.tem_indice(v)) {
                    fila.diminui_prio(v, distancias[v]);
                } else {
                    fila.insere(v, distancias[v]);
                }
            }
        }
    }
}

void Digrafo::encontraCamViavel(int X, int M) {
    vector<int> distancias, predecessores;
    
    // Executa o algoritmo de Dijkstra a partir do vértice X
    Dijkstra(X, distancias, predecessores);

    // Itera por todos os vértices do grafo
    for (int i = 0; i < num_vertices_; i++) {
        if (i != X) {
            // Verifica se a distância para o vértice i é menor ou igual a M
            if (distancias[i] <= M) {
                // Imprime o vértice e sua distância
                cout << i << ": " << distancias[i] << ", ";
                // Imprime o caminho do vértice i até a origem X
                int j = i;
                while (predecessores[j] != -1) {
                    cout << j << " ";
                    j = predecessores[j];
                }
                // Imprime o vértice de origem
                cout << X << endl;
            } else {
                // Caso a distância seja maior que M, indica que é inviável economicamente
                cout << i << ": economicamente inviavel ate " << X << endl;
            }
        }
    }
}


