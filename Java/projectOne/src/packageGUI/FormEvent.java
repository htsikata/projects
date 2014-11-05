package packageGUI;

import java.util.EventObject;

public class FormEvent extends EventObject {
	
	
	private String bookName;
	private String author;
	

	public FormEvent(Object source) {
		super(source);
		
	}

	public FormEvent(Object source, String bookName, String author) {
		
		super(source);
		this.bookName = bookName;
		this.author = author;
		
	}
	
	
	public String getName(){
		return bookName;
	
	}
	
	public String getAuthor(){
		return author;
	}
    public void setName(String bookName ){
    	this.bookName = bookName;
  
    }
    public void setAuthor(String author){
    	this.author = author;
    }
}
