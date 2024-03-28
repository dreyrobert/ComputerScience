const fatorial = () => {
    const numero = parseInt(prompt("Informe o número:"));

    let numeroFinal = 0
    for (let i = 1; i <= numero; i++) {
        numeroFinal += i;
    }
    console.log("Resultado: " + numeroFinal);
};

fatorial();