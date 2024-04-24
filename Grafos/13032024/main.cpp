#include "Grafo.h"
#include "Aresta.h"
#include <iostream>
using namespace std;

int main() {

    int x, y, it, n, n1, a, b;
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

            if (g.eh_clique(listaDeVertices)) {
                cout << "SIM" << "\n";
            }
            else {
                cout << "NAO" << "\n";
            }

            it--;
            break;
        case 'G':
            g.imprime_graus();
            cout << "\n";
            it--;
            break;
        case 'C':
            cin >> x >> y >> a >> b;
            if (g.existe_caminho_restrito(x, y, Aresta(a,b))) {
                cout << "SIM" << "\n";
            }
            else {
                cout << "NAO" << "\n";
            }
            it--;
            break;

        default:
            it--;
            break;
        }


    }

    return 0;
}