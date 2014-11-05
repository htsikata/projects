
// arrays hold same type of data types.

public class ArraysExample {
	
	public static void main(String[] args){
		// displaying a header 
		System.out.println("Number\tValue\tpoints\tTrue points");
		
		System.out.println("*******************************************"); //	
		
		// declare an array of strings and populate it .
		String[] mystring = new String[5];
		mystring[0] = "this";
		mystring[1] = " is ";
		mystring[2] = " cool";
		
		int[] myarray ={5,6,8,7,5,4,6,7,8,9,0}; // better to shortcut to save time.
		
		
		change(myarray);     // call the change method
		
		for (int k : myarray){
			System.out.println(k);
		  }
		
		
		System.out.println("*******************************************"); // 
		
		// display the elements in the string array separated by tab.
		
		for (int j=0;j<=mystring.length-3; j++){
			System.out.println(j + "\t"+ mystring[j]);
		    }
		
		System.out.println("*******************************************"); //
		
		// sum all elements and the index in myarray 
		int sum = 0;
		for(int k = 0; k<myarray.length; k++){
			sum = sum + myarray[k];
		}
		System.out.println("The sum of elments in myarray is " + sum);
		
		System.out.println("*******************************************"); //	
	    //enhanced for loop
		int totalsum = 0;
		for(int y : myarray){
			totalsum = totalsum + y;
		}
		System.out.println("the sum using enhanced for loop is " + totalsum);
	    }
		
	// method to add 5 to each element in the myarray.
		 public static void change(int[] x){
			for(int counter=0; counter<x.length; counter++)
		    x[counter]+=5;
 		   }
	}
