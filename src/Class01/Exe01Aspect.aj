package Class01;

public aspect Exe01Aspect {

	  pointcut nome(): execution (* Exe01.printHelloWorld());

	    before() : nome() {
	        System.out.print("Hello");
	    }

	    void around() : nome(){
	        //proceed(); Advice is executed after pointcut 
	        System.out.print(" Nobody!"); //without proceed method, advice replaces pointcut 
	        // proceed(); Advice is executed before pointcut
	    }

	    after() : nome(){
	        System.out.print(", DeeCarneiro!!");
	    }
}
