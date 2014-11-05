import java.io.*;
import java.net.*;
import java.awt.*;
import java.awt.event.*;


import javax.swing.*;


public class Server extends JFrame{
	
	
	          private JTextField userText;   
	          private JTextArea chatWindow;            
	          private ObjectOutputStream output;   // goes out to someone else
	          
	          // output stream flow from your computer to your friend's computer.
	          // imput stream is the other way round.
	          //communication happens through streams .
	          
	          private ObjectInputStream input;  // comes to you
	          
	          
	          private ServerSocket server;    //    server that listens and serves clients.
	          private Socket connection;      // the socket itself == the connection btn the computers
	          
	          
              // make the GIU 
	          // constructor
	          
	          public Server(){
	        	  super("HAYFORD'S CHAT APPLICATION -SEVER SIDE");      // title
	        	  
	        	  userText = new JTextField();           // setup textfield for user to type in text
	        	  
	        	  userText.setEditable(false);  // not allowed to type in anything when not connected to anyone.
	        	  userText.addActionListener(
	        			   new ActionListener(){
	        				  public void actionPerformed(ActionEvent event){
	        					  sendMessage(event.getActionCommand());
	        					  userText.setText("");
	        					  
	        				  }
	        			    }
	        			  );
	           	  
	        	  add(userText, BorderLayout.NORTH);   // add the text field to the screen
	        	  chatWindow = new JTextArea();        // create the chatwindow	        	  
	        	  add(new JScrollPane(chatWindow));    // add chatwindow
	        	  setSize(300,200);                    // set the size
	        	  setVisible(true);                    // setVisible
	          }  // end of constructor
	          
	    // set up and run the server.
	          
	          public void startRunning(){
	        	  try{
	        		  server = new ServerSocket(6789,100);   // port# and number of clients that can wait for a chat.(technically called backlog or queue link)
	        		     
	        		  while(true){
	        			  try{
	        				  waitForConnection() ;    //method to be built
	        			setupStreams();
	        				  
	        				  whileChatting();   // to be built.
	        				  
	        			  }catch(EOFException eofExcetion){
	        				  showMessage("\n Sever ended the connection!");
	        			  }finally{
	        				  closeCrap();
	        			  }
	        		  }
	        			
	        		 
	        	  }catch(IOException ioException){
	        		  ioException.printStackTrace();
	        	  }
	        	  
	        	  
	        	  
	          }
	          
	    // wait for connection, theb display connection information.  
	          
	          private void waitForConnection() throws IOException{
	        	  showMessage("Waiting for connection from the client side...");  
	        	  connection = server.accept();
	        	  showMessage(" Now connected to "+connection.getInetAddress().getHostName());
	          }
	         
	         private void setupStreams() throws IOException{
	        	 output = new ObjectOutputStream(connection.getOutputStream());
	        	 output.flush();
	        	 input = new ObjectInputStream(connection.getInputStream());
	        	 showMessage("\n Streams are now setup!\n");
	         }
	          
	          
	          
	          
	          
	       // code to run during the chat conversation
	          
	           private void whileChatting() throws IOException{
	        	  String message  = "You are now connected...";
	        	  sendMessage(message);
	        	  ableToType(true);
	        	  
	        	  do {
	        		  // To have a conversation
	        		  try{
	        			  message = (String) input.readObject();
	        			  showMessage("\n "+message);
	        			  
	        		  }catch(ClassNotFoundException ex){
	        			  showMessage("I dont know what you sent");
	        		  }
	        		  
	        		  
	        		  
	        	  }while(!message.equals("CLIENT - END"));
	        	  
	        	  
	        	  
	          }

	          
	          // close streams and sockets after u are done chatting
	          
	          private void closeCrap(){
	        	  showMessage("\n closing connections...\n");
	        	  ableToType(false);
	        	  
	        	  try{
	        		  
	        		  output.close();
	        		  input.close();
	        		  connection.close();
	        		  
	        		  
	        	  }catch(IOException ex){
	        		  ex.printStackTrace();
	        	  }
	        	  
	          }
           // send message to client
	          private void sendMessage(String message){
	        	  try{
	        		  output.writeObject("SERVER - " + message);
	        		  output.flush();
	        		  showMessage("\nSERVER - " + message);
	        	  }catch(IOException ex){
	        		  chatWindow.append("\n friend I can't send that message");
	        	  }
	        	  
	          }
	          
	         // updates chatWindow
	          
	          private void showMessage(final String text){
	        	  // update chatwindow
	        	  SwingUtilities.invokeLater(
	        			  new Runnable(){
	        				  public void run(){
	        				  chatWindow.append(text);
	        				  }
	        			  }
	        			 );
	        			  
	        	  
	          }
	          
	      // let user type stuff into their chat window.
	          private void ableToType(final boolean tof){
	        	  
	        	  SwingUtilities.invokeLater(
	        			  new Runnable(){
	        				  public void run(){
	        				  userText.setEditable(tof);
	        				  }
	        	
	        			  
	        			  }
	        			  
	        			);
	          }
	          
	          
	          
}
