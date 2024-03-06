package testacartao;

public class TestaCartao {

    public static void main(String[] args) {
        CartaoDebito robert = new CartaoDebito("Robert Biasoli Drey", "Visa", 2063, 199987328);
        robert.depositar(10000, "10.03.2002");
        robert.saque(5000, "11.03.2002");
        robert.saque(15000, "12.03.2002");
        
        robert.printExtrato();
        
    }
    
}
