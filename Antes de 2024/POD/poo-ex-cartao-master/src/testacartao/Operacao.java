/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package testacartao;
/**
 *
 * @author aluno
 */
public class Operacao {
    private int valor2;
    private String type;
    private String date;
    
    public Operacao(int valor, String tipo, String data){
        this.type = tipo;
        this.valor2 = valor;
        this.date = data;
    }
    
    public int getValor() {
        return this.valor2;
    }
    
    public String getType() {
        return this.type;
    }
    
    public String getDate() {
        return this.date;
    }
    
}
