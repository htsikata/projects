package packageOne;

import java.util.Random;

public class RandomNumberSim {
	public static void main(String[] args){


		Random randomSix = new Random();  //random number generator;

		int freqOne = 0;
		int freqTwo = 0;
		int freqThree = 0;
		int freqFour = 0;
		int freqFive = 0;
		int freqSix = 0;

		int face;   // the current value showing up ( for a die)
		for(int toss =1; toss < 500; toss++){

			face = 1 + randomSix.nextInt(6);

			switch (face) {

			case 1:
				++freqOne;
				break;

			case 2:
				++freqTwo;
				break;

			case 3:
				++freqThree;
				break;
			case 4:
				++freqFour;
				break;	
			case 5:
				++freqFive;
				break;	

			case 6:
				++freqSix;
				break;	
			}

		}
		//System.out.println(" Face\tFrequency ");
		System.out.println( "Face :" +"1\t\t2\t3\t4\t5\t6\t");
		//System.out.println();
		System.out.println("freq :" +freqOne +"\t" +freqTwo+"\t"+freqThree+"\t"+freqFour+"\t"+freqFive+"\t"+freqSix);
	}

}
