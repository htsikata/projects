package packageOne;

import java.util.Scanner;

public class PolyTest {

	public static void main(String[] args){

		PolyClassOne pone = new PolyClassOne();

		PolyClassTwo ptwo = new PolyClassTwo("Queen", "Eliza", "Captain" );

		Scanner input = new Scanner(System.in);
        System.out.println("YOUR DETAILS ARE NEEDED...");
        System.out.println("=============================");
		System.out.println(" What is your first Name?");

		String tmpName =   input.nextLine();

		pone.setName(tmpName);

		pone.displayPrompt(" What course are you taking this semester?");

		String tmpcourse = input.nextLine();

		pone.setCourse(tmpcourse);

		System.out.println();

		pone.displayPrompt(" what is our age?");

		int tmpAge = input.nextInt();

		pone.setAge(tmpAge);

		System.out.println();

		pone.displayPrompt(" Enter your four digit ID number?");

		int tmpId = input.nextInt();

		pone.setId(tmpId);

		System.out.println();

		pone.printDetails();

		System.out.println();

		if(pone.getId()==1234){

			System.out.println(" Your Id matched the records:");

			System.out.println();

			ptwo.printDetails();
		} else

		System.out.println(" Your Id did not match the records. You may try again");

	}

}
