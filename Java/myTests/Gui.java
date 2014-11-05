import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.*;

public class Gui extends JFrame{
	
	// create two variables;
	private JButton reg;
	private JButton custom;
	
// buuild a constructor 
	
	public Gui(){
		// this allows to access the jframe constructor of the superclass 
		super("the title of the frame");
		
		// make a layout for the window
		setLayout(new FlowLayout());
		
		//create and  add button 
		reg = new JButton("reg Button");
		add(reg);
		
		// get two on disk images and save them to b and x, it must be named Icon.
		Icon b = new ImageIcon(getClass().getResource("image1.png"));
		Icon x = new ImageIcon(getClass().getResource("image2.png"));
		// put image b on the custom button.
		custom = new JButton("Custom",b);
		// make the second image x a rollover image and add.
		custom.setRolloverIcon(x);
		add(custom);
		// handler class objection instantiation
		
		HandlerClass handler = new HandlerClass();
		
		reg.addActionListener(handler);
		custom.addActionListener(handler);
		
	}
	
	// this is the handler class , this is an inner class and it can see all the state variables of the outter class.
	
	private class HandlerClass implements ActionListener{
		// ActionLister class has only one method and this must be implemented here.
		// implements mean we have to imm
		public void actionPerformed(ActionEvent event){
			// what to happen when the button is clicked.
			
			JOptionPane.showMessageDialog(null, String.format("%s", event.getActionCommand()));
		}

		
	}
		

	
	
	
}
