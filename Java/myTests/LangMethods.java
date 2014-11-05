import java.util.*;

public class LangMethods {
	static String name=null; 
	static  boolean	control = true;
	static double y;

	public static void main(String[] args) { 
		boolean bb = true;
		int i=0;

		while(i<=3){  //begin while.
			do{
				LangMethods.askMe();
				timeTodoMath();
				y=LangMethods.doMath();
				LangMethods.Print(y);
				bb = LangMethods.promptMessage(); 
			} while(bb) ;
			if(bb==false)
				break;
			i++;
		} // end of while

		LangMethods.bye();

	} // end of main method.   

	public static void timeTodoMath(){

		System.out.println("=================================");
		System.out.println("It's now time to do some simple math.");
		System.out.println("=================================");

		System.out.println("This is a  simple addtion calculator. Try it! ");
		System.out.println("=================================");
	}

	// methods here 

	public static void  askMe(){
		System.out.println();
		Scanner input = new Scanner(System.in);
		System.out.println("What is your name?...");
		String name = input.nextLine();
		//if(name==null)
		//	control=false;
		System.out.println("Your name is "+ name);
	}

	public static void bye(){
		System.out.println("Goodbye and see you again! ");
		System.out.println("=============================");
	}

	public static double doMath(){

		Scanner sc = new Scanner(System.in);
		System.out.println("Enter the first number");
		double n1 = sc.nextInt();	
		System.out.println("Enter the second number");
		double n2 = sc.nextInt();
		return n1+n2;
	}


	public static void Print(double k){
		System.out.println("=======================================");
		System.out.println("Result of your calculation is  "+ k);
		System.out.println("=======================================");
		System.out.println();
	}

	public static boolean promptValue(boolean torf){
		return torf;

	}
	
	public static boolean promptMessage(){
		System.out.println("Do want to continue with the calculations?. Type yes or no");
		Scanner bool = new Scanner(System.in);
		String resp = bool.next();
		if(resp.equalsIgnoreCase("yes")|resp.equalsIgnoreCase("y"))
			return true;
		else 
			return false;		
	}

}


