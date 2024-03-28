const multiplicacao = (numero, vezes) => {
    let numeroFinal = 0
    for (let i = 0; i < vezes; i++) {
        numeroFinal += numero;
    }
    console.log("Resultado: " + numeroFinal);
};

const numero = parseInt(prompt("Informe o número:"));
const vezes = parseInt(prompt("Informe o número de vezes:"));
multiplicacao(numero, vezes);