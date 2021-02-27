package Aula02;

public aspect ExemploPointcutAspect {

	public pointcut point01() : execution ( void ExemploPointcut.Resolver(int));

	public pointcut point02() : call (ExemploPointcut.new());

	public pointcut point03() : call (ExemploPointcut.new(String, int));

	public pointcut point04() : get (* ExemploPointcut.dificuldade);

	public pointcut point05() : set( * ExemploPointcut.*);

	public pointcut point06() : call ( * ExemploPointcut.*(int));

	public pointcut point07() : call (* *.R*(..));

	public pointcut point08() : execution (* ExemploPointcut.*(..));

	public pointcut point09() : handler (Exception) && withincode(* ExemploPointcut.*(..) );

	after() : point01(){
		System.out.println("Executou Resolver");
	}

	after() : point02(){
		System.out.println("Criou um exemplo de pointcut");
	}

	after() : point03(){
		System.out.println("Criou um exemplo de pointcut com parametros");
	}

	int around() : point04(){
		System.out.println("Pegando nível de dificuldade");
		return 0;
	}
	 
	void around() : point05(){
		System.out.println("Setando um valor para qualquer atributo de exemplo pointcut");
	}
	
	after() : point06(){
		System.out.println("Foi chamado qualquer método com int");
	}
	
	after() : point07(){
		System.out.println("Foi chamado qualquer método que inicie com R");
	}
	
	after() : point08(){
		System.out.println("Executou qualquer metodo");
	}
	before() : point09(){
		System.out.println("Jogou uma Exceção");
	}
	
}
