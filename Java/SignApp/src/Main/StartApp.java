/**
 *
 * @author Hayford
 */

package Main;
import javafx.application.Application;
import javafx.stage.Stage;

public class StartApp extends Application {

	MainScreenController mainScreen;

	// SignOutScreenController soc = new SignOutScreenController();

	@Override
	public void start(Stage primaryStage) throws Exception {

		mainScreen = new MainScreenController();
		// ConnectToDB.createTables();
		mainScreen.showMainScreen();
		// mainScreen.mainStage.close();

	}

	// SignInScreenController signInScreen = new SignInScreenController();

	public static void main(String[] args) {
		launch(args);
	}

}
