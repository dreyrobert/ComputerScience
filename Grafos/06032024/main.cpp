#include "Circulo.h"
#include <iostream>

using namespace std;

int main() {
    try {
        double raio;

        cout << "Digite o raio do circulo: ";
        cin >> raio;
    
        Circulo circulo(raio);
        Circulo circulo_2(2);

        circulo.imprime_area();
        circulo_2.imprime_area();

        cout << "Dobro da área do segundo círculo:" << (circulo_2.calcula_area()*2) << "/n";
        cout << "Perímetro do segundo circulo:" << circulo_2.calcula_perimetro() << "/n";
    }
    catch (const exception &e) {
        cerr << "exception: " << e.what() << "\n";
    }

    return 0;
}
