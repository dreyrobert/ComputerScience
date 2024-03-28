function contarPositivosENegativos() {
    let positivos = 0;
    let negativos = 0;
    
    for (let i = 1; i <= 4; i++) {
        let numero = parseInt(prompt(`N${i}:`));
        if (numero >= 0) {
            positivos++;
        } else {
            negativos++;
        }
    }
    
    console.log(`${positivos} (+) e ${negativos} (-)`);
}

contarPositivosENegativos();
