package packageGUI;

import javax.swing.JFrame;

import javax.swing.SwingUtilities;

public class MainGui {
	
	public static void main(String[] args){
		
		SwingUtilities.invokeLater(new Runnable(){

			public void run() {
			
				MainFrame main = new MainFrame();							
			}			
		});
			
	}

}
