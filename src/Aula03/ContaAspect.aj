package Aula03;

public aspect ContaAspect {

	/*
	 * 1 - Criar um pointcut para interceptar a chamada do método creditar de Conta 
	 * 2 - Criar um pointcut para interceptar a chamada do método creditar de Conta Corrente
	 * 3 - Criar um pointcut para interceptar a chamada do método creditar de Conta e de Conta Corrente
	 * 4 - Criar um pointcut para interceptar toda vez que o saldo for alterado
	 * 5 - Criar um pointcut para interceptar toda vez que o saldo for alterado dentro de Conta
	 * 6 - Criar um pointcut para interceptar toda vez que o saldo for alterado dentro de um objeto de Conta
	 * 7 - Criar um pointcut para interceptar toda chamada após a execução do método transferir de Conta, dentro de Conta
	 * 8 - Criar um pointcut para interceptar a chamada do método creditar de Conta dentro do código do método transferir
	 * 9 - Criar um pointcut para interceptar qualquer excpetion levantada dentro da classe Conta
	 * 10 - Criar um pointcut para interceptar toda vez que o saldo for acessado dentro do método creditar da Conta Corrente
	 * 
	 */
//	public pointcut point01() : call (void Conta.creditar(double)) && within(Conta);
//  Executa em todas as subclasses
	public pointcut point01() : execution (void Conta.creditar(double)) && within(Conta);
	
//	public pointcut point02() : call (void ContaCorrente.creditar(double)) && within(ContaCorrente);
//  Executa em todas as subclasses
	public pointcut point02() : execution (void ContaCorrente.creditar(double)) && within(ContaCorrente);

	public pointcut point03() : call ( * Conta*.creditar(double));
	
	public pointcut point04() : set (* Conta.saldo);
	
	public pointcut point05() : set (* Conta.saldo) && within(Conta);

	public pointcut point06(Conta c) : set (* Conta.saldo) && this(c);
	
	public pointcut point07() : execution(* Conta.transferir(..)) && within(Conta);

	public pointcut point08() : call (* Conta.creditar(..)) && withincode(* Conta.transferir(..));
	
	public pointcut point09() : handler (Exception) && within(Conta);

	public pointcut point10()  : get (double Conta.saldo) && withincode(* ContaCorrente.creditar(..));
	
	before() : point01(){
		System.out.println("Creditaremos em conta");
	}
	
	before() : point02(){
		System.out.println("Creditaremos em conta corrente");
	}
	
	after() : point03(){
		System.out.println("Creditamos em conta o valor solicitado"
				+ "\n/////////////////////////////////////");
	}
	
	after() : point04(){
		System.out.println("O saldo foi alterado");
	}
	
	after() : point05(){
		System.out.println("O saldo foi alterado dentro de Conta");
	}
	
	after(Conta c) : point06(c){
		System.out.println("O saldo foi alterado dentro de um objeto de Conta");
	}	
	
	after() : point07(){
		System.out.println("Transferencia executada");
	}
	
	after() : point08(){
		System.out.println("Transferencia executada. Chamada do método creditar de Conta dentro do código do método transferir");
	}	
	
	before() : point09(){
		System.out.println("Deu um exception na Classe Conta");
	}
	
	after() : point10(){
		System.out.println("Saldo foi acessado dentro do método creditar da Conta Corrente");
	}
}