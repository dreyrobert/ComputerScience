#include "Grafo.h" 
#include <iostream>
using namespace std;

void info(Grafo g){
    std::cout << "Número de vertices e num de arestas: " << g.num_vertices() << " - " << g.num_arestas() << "\n";
}

int main() {

    int x, y, it, n, n1;
    char op;
    std::vector<int> listaDeVertices;

    cin >> x >> it;
    Grafo g = Grafo(x);

    while(it!=0){
        cin >> op;
        switch (op)
        {
        case 'I':
            cin >> x >> y;
            g.insere_aresta(Aresta(x, y));
            it--;
            break;

        case 'R':
            cin >> x >> y;
            g.remove_aresta(Aresta(x, y));
            it--;
            break;

        case 'E':
            cout << g.num_arestas() << "\n";
            it--;
            break;
        
        case 'Q':
           std::cin >> n;
            for (int i = 0; i < n; i++) {
                 std::cin >> n1;
                listaDeVertices.push_back(n1); 
            }

            g.eh_clique(listaDeVertices);

            it--;
            break;

        default:
            it--;
            break;
        }


    }

    return 0;
}