function calcularPercentualEntreDezEVinte() {
    let numeros = [];
    let num;
    let count = 0;
    
    do {
        num = parseFloat(prompt("Digite um número (digite 0 ou um número negativo para terminar):"));
        if (num > 0) {
            numeros.push(num);
            if (num >= 10 && num <= 20) {
                count++;
            }
        }
    } while (num > 0);
    
    let percentual = (count / numeros.length) * 100;
    
    console.log(`% entre 10 e 20: ${percentual.toFixed(2)}%`);
}

calcularPercentualEntreDezEVinte();
