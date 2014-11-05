import java.util.*;
//import java.util.ArrayList;
public class RandomNumbers {
     public static void main(String[] args){
    	 // random numbers generators
    	 
    	 Random rand1 = new Random();
    	 
    	 int k = rand1.nextInt(7);
    	 
    	 int k1 = 2 +2*rand1.nextInt(4);		// start at 2 with a diff of 2 up to 8   	 
    	 System.out.println(k);
    	 System.out.println(k1);
    	 double rand = Math.random();
    	 System.out.println(rand);     // rand between [0,1)
    	 
    	 // arrayys 
    	 
    	// one dimensional
    	 int[] a1 = {53,7,4,5,4,5,4,5}; // array initializer
    	 
    	 // print the elements in the array with a enhanced loop
    	 
    	 for(int i : a1){
    		 System.out.println(i);
    	 }
    	 
    	  // not array initializer  
    	 
    	 String[] s = new String[3];
    	 s[0] = "hayford";
    	 s[1] = "mary";
    	 s[2] = "david";
    	 
    	 // print out the elements
    	 
    	 for(String g : s){
    		 if(s.equals("david"))
    			 System.out.println(s);
    	 }
    	 
    	// multi dimensional array.
    	 
    	 double[][] md = { {45,45,4.4,3} ,{4,3,5.5,4}, {6,54,6,4} };
         // print all the elements in this array
    	 
    	 for(double d1[] : md)
    		 for(double d : d1)
    			 System.out.print("\t"  +d);
    	         System.out.println(); 
    	         
    	 ArrayList<String> list1 = new ArrayList<String>();
    	 
    	 list1.add(" this is the message I want to you to have today");
    	 list1.add("He has gotten the hand of everything possible in this building");
    	 list1.add("38384938493939383");
    	 
    	 //System.out.println(list1);
    	 for(int p=0 ;p<list1.size(); p++){
    		 System.out.println(list1.get(p));	 
    	
    	 }      
     }

}