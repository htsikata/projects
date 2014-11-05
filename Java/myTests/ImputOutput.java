
public class ImputOutput {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		final double  PI = 3.14159783;
		// the new line 
		System.out.println("hello world ");
		System.out.print("hello my friend  \n");
		
		System.out.print("\n");
		// tab is used when a uniform  separation is required.
		System.out.println("hello\tHayford\tfriend. ");
		
		// for setting width and pricission
		System.out.printf("pi = %.2f", PI);
		System.out.println();
		System.out.printf("pi = %12.4f", PI);
		System.out.println();
		System.out.printf("pi = %20.6f", PI);
		System.out.println();
	// call the method.	
		System.out.println("The square of the given argument is " + sq(9));
	   System.out.println();
	   System.out.println("The number is " + isEven(77));
		
			}
	// it is a good practice to keep the main method as simple and clear as possible.
	// do so by isolating task to methods that are always outside of the main method.
	
	//a method that is not affiliated to any class has to be static.  
	static int sq(int i){
	
		return i*i;
	}
	
	// predicate methods; returns true of false.
	static boolean isEven(int number){
		if(number%2==0)
			return true;
			else 
			return false;
	}
	// method arguments are passed by value . the method does not make any changes to the original 
	// value it that it manipulates in the method body.
	
    
}