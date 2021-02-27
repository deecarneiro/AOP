package Aula01;

public aspect Exe01Aspect {

	  pointcut nome(): execution (* Exe01.printHelloWorld());

	    before() : nome() {
	        System.out.print("Hello");
	    }

	    void around() : nome(){
	        proceed();
	        System.out.print(" Pra ninguém!");
	    }

	    after() : nome(){
	        System.out.print(", Vilmar!!");
	    }
}
