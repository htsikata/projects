package packageOne;

public class PolyClassTwo extends PolyClassOne {
	
	String wifeName ;
	String fatherName;
	String motherName;
	
	PolyClassTwo(){
		
	}
	
	PolyClassTwo(String wife, String mother, String father){
		this.wifeName = wife;
		this.motherName = mother;
		this.fatherName = father;
	}
	
   public void setWife(String wife){
	   wifeName = wife;
   }
   
   public void setMother(String mother){
	   motherName = mother;
	   
   }
   public void setFather(String father){
	   fatherName = father;
   }
   
   public String getWife(){
	   return wifeName;
   }
   
   public String getFather(){
	   return fatherName;
	   
   }
   public String getMother(){
	   return motherName;
	   
   }
   
   // this method overrides the supper class printDetails method
   public void printDetails(){
	  System.out.println(" Here are names of your family members:"); 
	  
	  System.out.println(" wife:" + this.wifeName + "  " +"mother :" +  this.motherName + "  " + "father : " + this.fatherName);
   }
   
   
   
}
