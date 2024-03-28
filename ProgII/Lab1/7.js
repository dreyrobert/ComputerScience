function fatorial(n) {
    if (n === 0 || n === 1) {
        return 1;
    }
    else {
        return n * fatorial(n - 1);
    }
}

const numero = parseInt(prompt("Digite um número:"));;
console.log(`O fatorial de ${numero} é ${fatorial(numero)}`);
