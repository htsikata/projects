package packageOne;

import java.util.Scanner;

public class FindMax {

	double num1, num2, num3,x,y,z;   // no static declaration

	public static void main(String[] args){  // main method

		FindMax mt = new FindMax();

		Scanner in = new Scanner(System.in);
		
	    mt.Prompt();
	        
		mt.num1 = in.nextDouble();

		mt.num2 = in.nextDouble();

		mt.num3 = in.nextDouble();

		mt.x = mt.maximum(mt.num1, mt.num2, mt.num3);
		
		mt.y = mt.multiply(mt.getnum1(), mt.getnum2(), mt.getnum3()); // just trying
		
		mt.z= mt.addAll(mt.getnum1(), mt.getnum2(), mt.getnum3());
		
		System.out.println("maximum is " + mt.x);	
		System.out.println();
		System.out.println("product is " + mt.y);
		System.out.println();
		System.out.println("sum is " + mt.z);
        

	} //end of main method

	// method to find max of three numbers from the user.
	private double maximum(double a, double b , double c){ 

		double maxvalue = a;

		if(b > maxvalue){

			maxvalue = b;					
		}
		if(c > maxvalue){	

			maxvalue = c;
		}
		return maxvalue;
	}

	// method to display prompt
	private void Prompt(){
		System.out.println("==========================================================");
		System.out.println("Enter three numbers separated by space to begin calculation.");
		System.out.println("==========================================================");
		}
	

	// method to multiply the numbers
	private double multiply(double num1,double num2, double num3){

		return num1*num2*num3;	
	}

	private double addAll(double num1, double num2, double num3){
		return num1+num2+num3;
	}

	// getters
	public double getnum1(){
		return num1;
	}
	public double getnum2(){
		return num2;
	}

	public double getnum3(){
		return num3;
	}
}

