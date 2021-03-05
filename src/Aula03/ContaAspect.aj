package Aula03;

public aspect ContaAspect {

	/*
	 * 1 - Criar um pointcut para interceptar a chamada do método creditar de Conta
	 * 2 - Criar um pointcut para interceptar a chamada do método creditar de Conta
	 * Corrente 
	 * 3 - Criar um pointcut para interceptar a chamada do método creditar
	 * de Conta e de Conta Corrente 
	 * 4 - Criar um pointcut para interceptar toda vez
	 * que o saldo for alterado 
	 * 5 - Criar um pointcut para interceptar toda vez que
	 * o saldo for alterado dentro de Conta 
	 * 6 - Criar um pointcut para interceptar
	 * toda vez que o saldo for alterado dentro de um objeto de Conta 
	 * 7 - Criar um
	 * pointcut para interceptar toda chamada após a execução do método transferir
	 * de Conta, dentro de Conta 8 - Criar um pointcut para interceptar a chamada do
	 * método creditar de Conta dentro do código do método transferir 9 - Criar um
	 * pointcut para interceptar qualquer excpetion levantada dentro da classe Conta
	 * 10 - Criar um pointcut para interceptar toda vez que o saldo for acessado
	 * dentro do método creditar da Conta Corrente
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

	/// pointcut point01
	before(double valor) : point01() && args(valor,..){
		System.out.println("Creditaremos " + valor + " em conta");
	}

	void around(double valor, Conta c) : point01() && args(valor,..) && target(c){
		System.out.println("Estamos a creditar o valor de " + valor + ". Seu saldo atual é " + c.saldo);
		proceed(valor, c);
	}

	after(double valor, Conta c) : point01() && args(valor,..) && target(c){
		System.out.println("Creditamos " + valor + ". Seu saldo atualizado é " + c.saldo);
	}
	
//	/// pointcut point02
	before(double valor) : point02() && args(valor,..){
		System.out.println("Creditaremos " + valor + " em conta corrente");
	}

	void around(double valor, ContaCorrente c) : point02() && args(valor,..) && target(c){
		System.out.println(
				"Estamos a creditar o valor de " + valor + " na sua conta corrente. Seu saldo atual é " + c.saldo);
		proceed(valor, c);
	}

	after(double valor, ContaCorrente c) : point02() && args(valor,..) && target(c){
		System.out.println("Creditamos " + valor + " na sua conta corrente. Seu saldo atualizado é " + c.saldo);
	}
//
//	/// pointcut point03
	before(double valor) : point03() && args(valor,..){
		System.out.println("///////////////////////////////////////////\n" + "Valor a ser creditado:" + valor);
	}

	void around() : point03(){
		System.out.println("Processando credito...");
		proceed();
	}

	after(Conta c) : point03() && target(c){
		System.out.println(
				"Valor do saldo atualizado:" + c.saldo + "" + "\n/////////////////////////////////////////////\n");
	}

		
//	/// pointcut point04
	before(Conta c) : point04() && target(c){
		System.out.println("***Seu saldo de " + c.saldo + " vai ser alterado***");
	}

	void around(Conta c, double valor) : point04() && target(c) && args(valor,..){
		System.out.println("Alterando seu saldo de:" + c.saldo + " para:" + valor);
		proceed(c, valor);
	}

	after(Conta c) : point04() && target(c){
		System.out.println("O saldo alterado para:" + c.saldo);
	}
//	
//	
//	///pointcut point05
	before() : point05(){
		System.out.println("O saldo vai alterado dentro de Conta");
	}
	
	void around() : point05(){
		System.out.println("Alterando saldo...");
	}
	
	after(Conta c) : point05() && target(c){
		System.out.println("O saldo foi alterado dentro de Conta"+c.getNumero());
	}
//
//	// pointcut point06
	before(Conta c) : point06(c){
		System.out.println("O saldo foi alterado dentro de um objeto de Conta: "+c.getNumero());
	}
	
	void around(Conta c) : point06(c){
		proceed(c);
	}
	
	after(Conta c) : point06(c){
		System.out.println("O saldo foi alterado dentro de um objeto de Conta: "+c.getNumero());
	}	
//
	// pointcut point07
	before() : point07(){
		System.out.println("Transferencia executada");
	}

	void around(Conta c1, Conta c2, double valor ) : point07() && target(c1) && args(c2, valor){
		System.out.println("Transferencia do valor "+valor+" interceptada de:"+c1.getNumero()+"para"+c2.getNumero());
		c1.saldo = 0;
		proceed(c1,c2, 0);
	}

	after(Conta c2, double valor) : point07() && args(c2, valor){
		System.out.println("Transferencia executada: "+valor);
	}
//
//	// pointcut point08
	before() : point08(){
		System.out.println("Chamada do método creditar de Conta dentro do código do método transferir");
	}
	
	void around() : point08(){
		System.out.println("Processando transferencia...Creditando valor...");
	}
	
	after() : point08(){
		System.out.println("Transferencia executada. Chamada do método creditar de Conta dentro do código do método transferir");
	}	
	
	/// pointcut point09
	/// Mensagem de erro que só before é suportado para pointcuts com handler

	before() : point09(){
		System.out.println("Deu um exception na Classe Conta");
	}
	void around() : point09() {
		System.out.println("Deu um exception na Classe Conta");
	}
	
	after() : point09(){
		System.out.println("Processando...Algo deu errado");
	}

//	// pointcut point10
	before() : point10(){
		System.out.println("Acesso ao saldo via creditar...");
	}
	double around(ContaCorrente c) : point10() && target(c){
		System.out.println("Acessando saldo dentro do método creditar da Conta Corrente"+ c.saldo);
		return 0.0;
	}
	after() : point10(){
		System.out.println("Saldo foi acessado dentro do método creditar da Conta Corrente");
	}
}