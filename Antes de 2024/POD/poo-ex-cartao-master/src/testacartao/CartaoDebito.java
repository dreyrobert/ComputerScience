package testacartao;
import java.util.ArrayList;

public class CartaoDebito extends Cartao {
    private int saldo;
    private int agencia;
    private int conta;
    ArrayList<Operacao> extrato = new ArrayList();
    
    public CartaoDebito(String titular, String bandeira, int agencia, int conta) {
        super(titular, bandeira);
        this.agencia = agencia;
        this.conta = conta;
        this.saldo = 0;
    }

    public int getAgencia() {
        return agencia;
    }

    public void setAgencia(int agencia) {
        this.agencia = agencia;
    }

    public int getConta() {
        return conta;
    }

    public void setConta(int conta) {
        this.conta = conta;
    }
    
    public void depositar(int valor, String date) {
        Operacao op = new Operacao(valor, "Deposito", date);
        this.saldo += valor;
        extrato.add(op);
    }
    
    public void saque(int valor, String date) {
        Operacao op = new Operacao(valor, "Saque", date);
        this.saldo -= valor;
        extrato.add(op);
    }

    public void printExtrato() {
        int i = 0;
        System.out.printf("Este cartão pertence à %s\nAgencia: %d - Conta: %d (%s)\n\n", this.getTitular(), this.getAgencia(), this.getConta(), this.getBandeira());
        System.out.printf("Formato: Data | Operação | Valor\n");
        for (Operacao y: extrato) {
            System.out.printf("%s | %s | %d \n", y.getDate(), y.getType(), y.getValor());
            i++;
        }
        System.out.printf("Saldo atual -> %d\n", this.saldo);
    }
}
