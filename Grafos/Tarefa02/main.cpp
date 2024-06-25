/*
 * Tarefa 04 - Grafeira Linhas Aereas
 *
 * GEN254 - Grafos - 2024/1
 *
 * Nome:      XXXX
 * Matricula: XXXX
 */

#include "Digrafo.h"
#include "Aresta.h"
#include <iostream>
using namespace std;

int main() {

    int c, v, r, x, y, z, a, b;

    cin >> c >> v;
    Digrafo g = Digrafo(c);

    while(v!=0){
        cin >> x >> y >> z;
        Aresta e = Aresta(x, y, z);
        g.insere_aresta(e);
        v--;
    }

    Digrafo invertido = g.inverter();
    
    cin >> r;

    while(r!=0){
        cin >> a >> b;

        invertido.encontraCamViavel(a, b);

        r--;
    }

    return 0;
}