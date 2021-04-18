package Class03;

public class CurrentAccount extends BankAccount{

	public CurrentAccount(String number, double value) {
		super(number, value);
	}
	
	public void creditar(double value) {
		this.balance += value;
		System.out.println("Current Account");
	} 

}
