import java.util.*;
public class ListTest {

	public static void main(String[] args) {
		
	// The List interface has two concrete implementations		
		// ArrayList and LinkedList		
		//examples
       List<Integer> arrayList = new ArrayList<>();
       arrayList.add(1); // this is autoboxed to new Integer(1)
       arrayList.add(2);
       arrayList.add(3); 
       arrayList.add(1);
       arrayList.add(4); 
       arrayList.add(0,10); // add 10 at position 0
       arrayList.add(3,30);

       System.out.println("a list of integer in the array list :");
       System.out.println(arrayList);

       LinkedList<Object> linkedList = new LinkedList<Object>(arrayList);
       linkedList.add(1,"red");
       linkedList.removeLast();
       linkedList.addFirst("green");

       System.out.println("display the linked list forward :");
       ListIterator<Object> listIterator = (ListIterator<Object>) linkedList.iterator();
       while(listIterator.hasNext()){
    	   System.out.print(listIterator.next() + " ");  
       }
       System.out.println(); 

       System.out.println("display the linked list backward: ");
       listIterator = linkedList.listIterator(linkedList.size());
       while(listIterator.hasPrevious()){
    	   System.out.print(listIterator.previous() + " ");
       }

     }

}
