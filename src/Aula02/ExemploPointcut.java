package Aula02;

import java.io.IOException;

public class ExemploPointcut {
	String titulo;
	int dificuldade;

	ExemploPointcut() {
		titulo = new String("Exemplo de pointcut");
		dificuldade = 1;
	}

	ExemploPointcut(String s, int diff) {
		titulo = new String(s);
		dificuldade = diff;
	}

	void Resolver(int diff) {
		if (dificuldade == diff) {
			System.out.println("Resolvido!");
		}
	}
	
	 void testMethod() throws Exception {
	    String test = null;
	    test.toString();
	}
	
	public static void main(String[] args) {
		ExemploPointcut e01 = new ExemploPointcut();
		e01.Resolver(1);
		ExemploPointcut e02 = new ExemploPointcut("Novo", 10);
		try {
			e01.testMethod();
		} catch (Exception e) {
		}
//		System.out.println(e02.dificuldade);
//		e02.titulo = "Novo";
	}
}