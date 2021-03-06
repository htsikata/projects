// this class is  the controller class 
// all communications should go through the controller, the mainframe.
// idealy, we want little reliance between the components
// The components should be decoupled as possible

package packageGUI;

import java.awt.BorderLayout;
import java.awt.TextArea;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JTextArea;
import javax.swing.SwingUtilities;

public class MainFrame extends JFrame{

	private TextPanel textPanel;    // private fields.
	private Toolbar toolbar;
	private FormPanel formPanel;

	public MainFrame(){

		super("My Awesome GUI");	 // invoke the parent class constructor

		toolbar = new Toolbar();

		textPanel = new TextPanel() ;
		
		formPanel = new FormPanel();
		
		toolbar.setStringListerner(new StringListener(){

			public void textEmitted(String text) {
				textPanel.appendText(text);
				
			}
			
		});
		
		setLayout(new BorderLayout());    // set the type of layout manager for controls 

		add(toolbar,BorderLayout.NORTH);

		add(textPanel, BorderLayout.CENTER);    // add text area to center of the manager

		add(formPanel,BorderLayout.WEST);
		
		setSize(600,400);     // set the size of the window(the jframe) 

		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);  // what happens when you click close 

		setVisible(true);    // make the frame visible; to display.
	}

}
