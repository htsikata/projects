import java.util.Date;
import java.util.Scanner;
// The problem is to alternatively print two given names with 1 second interval apart.
// the user must enter the names to be printed on the screen.
// this will be implemented using threads.

// the class that implements the runnable interface.
class MultTester implements Runnable{
		String name1, name2;
		String name =null;
		
	 public MultTester(String name){  // constructor
		 this.name = name;	 
	 }				
		@Override               // overide the run method in the runnable interface.
		public void run() {			
		sayN(name);			    // this method will be run when the thread is started 
		System.out.println("waiting for 1.5 second...");
		}                       // with the t.start() method
		
		//public void setN(String n){
		//	this.name = n;
		// }
				
		public void sayN(String n){
			System.out.println(n);
		}
		
		public void acceptN(){
			Scanner input = new Scanner(System.in);
			System.out.println("Enter the first name right now");
		    name1 = input.nextLine();
			System.out.println("Enter the second name now");
			name2 = input.nextLine();
		}
		
		public String getN1(){
          return name1;
	     }
		
	    public String getN2(){
		  return name2;
	    }	
		
   }

	/// the driver class here


 public class MultThreading {
	private static  int  alternatePrints=2;
	 private static  int i =0;
	 Thread t3;
	 public static void main(String[]args) throws InterruptedException{
		 MultTester tester= new MultTester(null);
		 tester.acceptN();
		 Thread t3 = new Thread(new AnotherTred());
		 while(i<=alternatePrints){
			 Thread t1 = new Thread(new MultTester(tester.getN1())); 
			 Thread t2 = new Thread(new MultTester(tester.getN2()));
			 
		     t1.start();
		     t1.sleep(1500);	     
		     t2.start();
		     t2.sleep(1500);		     
		     i++;
		 }
		 
		 t3.start();
		 //t3.sleep(5000);
		 System.out.println();
		 AnotherTred a = new AnotherTred();
		 a.tell();
		 a.print();	 
	 }
	
 }
 
 // yet another class for thread
 
 class AnotherTred implements Runnable{
	 String yourName;
	 
	String names[] = {"David", "Mary", "Tsikata","Hayford"};
	
	public AnotherTred(){    //constructor
		this.names= names;
	}
	
	 public void run(){
		 
		 System.out.println("this is displaying time now...");	
		 Scanner in = new Scanner(System.in);
		 System.out.println("Enter name now...");
		
		 yourName = in.nextLine();
		 if(yourName.equals("may")){
		 System.out.println("your name is "+ yourName + " I can't display time for you");
          }
           else
			
	     System.out.println("The date and time now is " + new Date().toString());		 		 
        }
	 
	 
	 public void tell(){
		 System.out.println("This method will be run after all..");
	 }
	 
	 public void print(){
		 for(String s : names){
			 System.out.println(s);
		 }
	 }
	 	 
 }

