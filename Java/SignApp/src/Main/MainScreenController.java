/**
 *
 * @author Hayford
 */

package Main;
import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.stage.Stage;


public class MainScreenController implements Initializable {
@FXML 
public Label lblSucessMessage;

	SignOutScreenController sos = new SignOutScreenController();
	SignInScreenController sis = new SignInScreenController();

	private final  Stage mainStage = new Stage();

	public void showMainScreen() throws IOException {
		Parent root = FXMLLoader.load(getClass().getResource(
				"/FXML/mainScreen.fxml"));
		Scene scene = new Scene(root, 800, 760);
                scene.getStylesheets().add("/CSS/mainScreen.css");
		mainStage.setScene(scene);
		mainStage.setTitle("MATH RESOURCE CENTER STUDENT SIGN IN");
                //mainStage.setFullScreen(true);
                // mainStage.setResizable(false);
		mainStage.show();
	}

	@FXML
	public void firstSignInButton(ActionEvent event) throws Exception {
		// System.out.println("first sign in button is clicked!");
		sis.showSignIn();
                
	}
	
	@FXML
	public void firstSignOutButton(ActionEvent event) throws IOException {
		// System.out.println("first sign Out button is clicked!");
		sos.showSignOut();
	}

	@Override
	public void initialize(URL arg0, ResourceBundle arg1) {
		
	}

}
