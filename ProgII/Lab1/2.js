const venda = () => {
    const valorProduto = parseFloat(prompt('Informe o valor do produto:'));
    let formaPagamento = parseInt(prompt('Informe a forma de pagamento (1 para pagamento à vista, 2 para pagamento a prazo):'));

    while (formaPagamento !== 1 && formaPagamento !== 2) {
        alert("Por favor, informe apenas 1 para pagamento à vista ou 2 para pagamento a prazo.");
        formaPagamento = parseInt(prompt('Informe a forma de pagamento (1 para pagamento à vista, 2 para pagamento a prazo):'));
    }

    if (formaPagamento === 1) {
        let valorFinal = valorProduto * 0.95;
        console.log("Preço à vista: R$"+valorFinal.toFixed(2));
    } else {
        let valorFinal = valorProduto * 1.1;
        console.log("Preço a prazo: R$"+valorFinal.toFixed(2));
    }
};

venda();
