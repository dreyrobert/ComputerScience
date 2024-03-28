#ifndef CIRCULO_H

#define CIRCULO_H

class Circulo {
public:
    Circulo(double raio);
    
    double calcula_area();
    double calcula_perimetro();
    void imprime_area();
private:
    double raio_;
};

#endif /* CIRCULO_H */
