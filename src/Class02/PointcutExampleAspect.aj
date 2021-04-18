package Class02;

public aspect PointcutExampleAspect {

	public pointcut point01() : execution ( void PointcutExample.Solve(int));

	public pointcut point02() : call (PointcutExample.new());

	public pointcut point03() : call (PointcutExample.new(String, int));

	public pointcut point04() : get (* PointcutExample.diff);

	public pointcut point05() : set( * PointcutExample.*);

	public pointcut point06() : call ( * PointcutExample.*(int));

	public pointcut point07() : call (* *.S*(..));

	public pointcut point08() : execution (* PointcutExample.*(..));

	public pointcut point09() : handler (Exception) && withincode(* PointcutExample.*(..) );

	after() : point01(){
		System.out.println("Solve method was executed");
	}

	after() : point02(){
		System.out.println("A PointcutSample was created");
	}

	after() : point03(){
		System.out.println("A PointcutExample was created with parameters");
	}

	int around() : point04(){
		System.out.println("Getting difficult level");
		return 0;
	}
	 
	void around() : point05(){
		System.out.println("Setting a value to any attribute in PointcutSample");
	}
	
	after() : point06(){
		System.out.println("Calling any method with type int parameter in PointcutSample");
	}
	
	after() : point07(){
		System.out.println("Any method that starts with S was called");
	}
	
	after() : point08(){
		System.out.println("Any method was executed");
	}
	before() : point09(){
		System.out.println("Throws an exception");
	}
	
}
