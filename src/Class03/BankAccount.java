package Class03;

public class BankAccount {

	private String number;
	protected double balance;

	public BankAccount(String number, double value) {
		this.number = number;
		this.balance = value;
	}

	public String getnumber() {
		return number;
	}

	public void setnumber(String number) {
		this.number = number;
	}

	public double getbalance() {
		return balance;
	}

	public void setbalance(double balance) {
		this.balance = balance;
	}

	public void credit(double valor) {
		this.balance = this.balance + valor;
		System.out.println(this.balance);
	}
	
	public void debit(double valor) throws Exception {
		if ((this.balance - valor) > 0.0) {
			this.balance -= valor;
		} else {
			throw new Exception("Insufficient funds!");
		}		
	}
	
	public void transfer(BankAccount c, double valor) throws Exception {
		this.debit(valor);
		c.credit(valor);
	}
	
	 void testException() throws Exception {
		    String test = null;
		    test.toString();
		}

	public static void main(String[] args) {
		BankAccount c1 = new BankAccount("1234", 100.0);
		BankAccount c2 = new CurrentAccount("4321", 50.0);
		
		c1.credit(10);
		c2.credit(20);
		try {
			c1.transfer(c2, 20);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			c1.debit(10);
		} catch (Exception e) {
			e.printStackTrace();
		}
//		
//		try {
//			c1.testException();
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		
	}

	@Override
	public String toString() {
		String tostr= "number = " + this.number;
		tostr += "\nbalance = " + this.balance;
		return tostr;
	}
}
