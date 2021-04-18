package Class02;

import java.io.IOException;

public class PointcutExample {
	String title;
	int diff;

	PointcutExample() {
		title = new String("Pointcut Example");
		diff = 1;
	}

	PointcutExample(String s, int diff) {
		title = new String(s);
		diff = diff;
	}

	void Solve(int diff) {
		if (diff == diff) {
			System.out.println("Solved!");
		}
	}
	
	 void testMethod() throws Exception {
	    String test = null;
	    test.toString();
	}
	
	public static void main(String[] args) {
		PointcutExample e01 = new PointcutExample();
		e01.Solve(1);
		PointcutExample e02 = new PointcutExample("New", 10);
		try {
			e01.testMethod();
		} catch (Exception e) {
		}
//		System.out.println(e02.diff);
//		e02.title = "New";
	}
}