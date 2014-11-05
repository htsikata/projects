package packageGUI;

import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JPanel;

public class Toolbar extends JPanel implements ActionListener{   

	private JButton retrieve;
	private JButton insert;
	private JButton update;
	private JButton quit;
	// private TextPanel textPanel ;

	private StringListener textListener;

	// constructor for the toolbar. 

	public Toolbar(){	
		//	create instances of the buttons

		retrieve = new JButton("Retrieve Records");  // string arg is the label displayed
		insert = new JButton("Insert Records");
		update = new JButton("Update Records");
		quit = new JButton("Exit");

		retrieve.addActionListener(this);
		insert.addActionListener(this);
		update.addActionListener(this);
		quit.addActionListener(this);

		//  set layout for the toolbar

		setLayout(new FlowLayout(FlowLayout.LEFT));

		// add the buttons to the toolbar
		add(retrieve);
		add(insert);
		add(update);
		add(quit);
	}

	/*public void setTextPanel(TextPanel textPanel){

		this.textPanel = textPanel;
	}*/

	public void setStringListerner(StringListener listener){

		this.textListener = listener;
	}	
	// implementation this from the ActionListener interface.

	public void actionPerformed(ActionEvent e) {

		JButton clicked = (JButton)e.getSource();

		if(clicked == retrieve){
			if(textListener != null){
				textListener.textEmitted(" retrieving records\n");
			}
		} else if (clicked == insert){
			textListener.textEmitted(" Inserting records\n");
		}  else {
			textListener.textEmitted("something else was clicked");
		}
	}
}
