package Class03;

public aspect BankAccountAspect {

	//Pointcut intercepts the execution of the method credit from BankAccount class
	public pointcut point01() : execution (void BankAccount.credit(double)) && within(BankAccount);

	//Pointcut intercepts the execution of the method credit from CurrentAccount class
	public pointcut point02() : execution (void CurrentAccount.credit(double)) && within(CurrentAccount);

	//Pointcut intercepts the call of the method credit from BankAccount and its subclasses 
	public pointcut point03() : call ( * BankAccount*.credit(double));

	//Pointcut intercepts the setting of the attribute balance 
	public pointcut point04() : set (* BankAccount.balance);

	//Pointcut intercepts the setting of the attribute balance from BankAccount class
	public pointcut point05() : set (* BankAccount.balance) && within(BankAccount);

	//Pointcut intercepts the setting of the attribute balance from object BankAccount type
	public pointcut point06(BankAccount c) : set (* BankAccount.balance) && this(c);

	//Pointcut intercepts the execution of the method transfer inside BankAccount
	public pointcut point07() : execution(* BankAccount.transfer(..)) && within(BankAccount);

	//Pointcut intercepts the calling of the method credit with code BankAccount.transfer(..)
	public pointcut point08() : call (* BankAccount.credit(..)) && withincode(* BankAccount.transfer(..));

	//Pointcut intercepts the expection with handler inside BankAccount class
	public pointcut point09() : handler (Exception) && within(BankAccount);

	//Point intercepts  the getting of the balance attribute with code CurrentAccount.credit(..)
	public pointcut point10()  : get (double BankAccount.balance) && withincode(* CurrentAccount.credit(..));

	/// Pointcut point01 advices
//	before(double value) : point01() && args(value,..){
//		System.out.println(value + " will be credited");
//	}
//
//	void around(double value, BankAccount c) : point01() && args(value,..) && target(c){
//		System.out.println("The value of " + value + " will been credited . Your current balance is " + c.balance);
//		proceed(value, c);
//	}
//
//	after(double value, BankAccount c) : point01() && args(value,..) && target(c){
//		System.out.println("The value of " + value + " was credited. Your updated balance is " + c.balance);
//	}
	
//	/// Pointcut point02 advices
//	before(double value) : point02() && args(value,..){
//		System.out.println(value + "will be credited in a Current Account");
//	}
//
//	void around(double value, CurrentAccount c) : point02() && args(value,..) && target(c){
//		System.out.println(
//				"The value of " + value + " will be credited in a Current Account. Your current balance is " + c.balance);
//		proceed(value, c);
//	}
//
//	after(double value, CurrentAccount c) : point02() && args(value,..) && target(c){
//		System.out.println("The value of " + value + " was credited in a Current Account. Your current balance is " + c.balance);
//	}

 	/// Pointcut point03 advices
//	before(double value) : point03() && args(value,..){
//		System.out.println("///////////////////////////////////////////\n" + "The value will been credited is:" + value);
//	}
//
//	void around() : point03(){
//		System.out.println("Processing...");
//		proceed();
//	}
//
//	after(BankAccount c) : point03() && target(c){
//		System.out.println(
//				"The updated balance is:" + c.balance + "" + "\n/////////////////////////////////////////////\n");
//	}

		
	/// Pointcut point04 advices
//	before(BankAccount c) : point04() && target(c){
//		System.out.println("***Your balance " + c.balance + " will be updated***");
//	}
//
//	void around(BankAccount c, double value) : point04() && target(c) && args(value,..){
//		System.out.println("Updating your balance from:" + c.balance + " to:" + value);
//		proceed(c, value);
//	}
//
//	after(BankAccount c) : point04() && target(c){
//		System.out.println("Your balance was updated to:" + c.balance);
//	}
	
	
	/// Pointcut point05 advices
//	before() : point05(){
//		System.out.println("Your balance will be updated inside Bank Account");
//	}
//	
//	void around() : point05(){
//		System.out.println("Updating balance...");
//	}
//	
//	after(BankAccount c) : point05() && target(c){
//		System.out.println("Your balance was updated inside Bank Account"+c.getnumber());
//	}

	// Pointcut point06 advices
//	before(BankAccount c) : point06(c){
//		System.out.println("Your balance will be updated inside a BankAccount object type: "+c.getnumber());
//	}
//	
//	void around(BankAccount c) : point06(c){
//		proceed(c);
//	}
//	
//	after(BankAccount c) : point06(c){
//		System.out.println("Your balance was updated inside a BankAccount object type: "+c.getnumber());
//	}	

	// Pointcut point07 advices
//	before() : point07(){
//		System.out.println("A transfer will been executed");
//	}
//
//	void around(BankAccount c1, BankAccount c2, double value ) : point07() && target(c1) && args(c2, value){
//		System.out.println("Transfering "+value+" from:"+c1.getnumber()+" to:"+c2.getnumber());
//		c1.balance = 0;
//		proceed(c1,c2, 0);
//	}
//
//	after(BankAccount c2, double value) : point07() && args(c2, value){
//		System.out.println("Transfer was executed: "+value);
//	}

	// Pointcut point08 advices
//	before() : point08(){
//		System.out.println(" Calling credit method inside code method transfer ");
//	}
//	
//	void around() : point08(){
//		System.out.println("Processing...");
//	}
//	
//	after() : point08(){
//		System.out.println("Transfer was executed. Calling credit method inside code method transfer");
//	}	
	
	/// Pointcut point09 advices
	/// Just before advices is supported on handler pointcut
//	before() : point09(){
//		System.out.println("Throwing an exception on BankAccount error");
//	}
//	void around() : point09() {
//		System.out.println("Doesn't work");
//	}
//	
//	after() : point09(){
//		System.out.println("Doesn't work");
//	}

	// Pointcut point10 advices
	before() : point10(){
		System.out.println("Access balance by credit method...");
	}
	double around(CurrentAccount c) : point10() && target(c){
		System.out.println("Accessing balance inside credit method from Current Account"+ c.balance);
		return 0.0;
	}
	after() : point10(){
		System.out.println("Balance was accessed foi acessado inside credit method from Current Account");
	}
}