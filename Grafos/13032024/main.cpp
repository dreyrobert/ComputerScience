#include "Grafo.h"
#include "Aresta.h"
#include <iostream>

using namespace std;

int main() {
    try {
        Grafo g(4);

        g.imprimir();
    } catch (const exception &e) {
        cerr << "exception: " << e.what() << "\n";
    }
    return 0;
}