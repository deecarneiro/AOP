package Class03;

public class ContaCorrente extends Conta{

	public ContaCorrente(String numero, double value) {
		super(numero, value);
	}
	
	public void creditar(double valor) {
		this.saldo += valor;
		System.out.println("Conta Corrente");
	} 

}
