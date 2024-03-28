function calcularSalario(horasTrabalhadas, valorHora) {
    let salario = valorHora * horasTrabalhadas;

    if (horasTrabalhadas > 200) {
        salario *= 1.05;
    }

    return salario;
}

function main() {
    const horasTrabalhadas = parseFloat(prompt('Informe as horas trabalhadas:'));
    const valorHora = parseFloat(prompt('Informe o valor da hora:'));

    let salario = calcularSalario(horasTrabalhadas, valorHora);

    console.log("Salário: R$" + salario.toFixed(2));
}

main();