/**
 *
 * @author Hayford
 */
package Main;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ResourceBundle;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javafx.animation.FadeTransition;
import javafx.animation.SequentialTransition;
import javafx.animation.Timeline;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import javafx.util.Duration;

public class SignInScreenController implements Initializable {
	@FXML
	private Label lblSignInMessage;
        @FXML 
	private TextField tfFirstName;
	@FXML
	private TextField tfInitial;
	@FXML
	private TextField tfLastName;
	@FXML
	private ComboBox<String> cbCourse;
	@FXML
	private ComboBox<String> cbInstructor;

	@FXML
	private Button btnSecondSignIn;
	// private TextArea
       

        
	final Stage signInStage = new Stage();
	DataBank dataBank;

	// method to show signIn screen
	public void showSignIn() throws Exception {
		Parent signInterface = FXMLLoader.load(getClass().getResource(
				"/FXML/signInScreen.fxml"));
		Scene signInScene = new Scene(signInterface);
                signInScene.getStylesheets().add("/CSS/signInScreen.css");
		signInStage.setScene(signInScene);
                signInStage.setTitle("MATH RESOURCE LAB SIGN IN");
		signInStage.show();
	}

	// method to handle second sign Out button events
	@FXML
	public void secondSignInButton(ActionEvent event) throws Exception {

		if (gatherSignInInfo()[0].isEmpty() || gatherSignInInfo()[2].isEmpty()) {
			lblSignInMessage
					.setText("You must enter your first and last names to sign in!");

		} else if (findPattern(gatherSignInInfo()[0])
				|| findPattern(gatherSignInInfo()[2])) {
			lblSignInMessage
					.setText("Your name cannot contain non-word characters!");
		} else {

			putIntoDB(gatherSignInInfo()); // gatherSignInfo() returns an array
			lblSignInMessage.setText("sign in successful!");								
			// get the window and close it
			Stage signInStage = (Stage) btnSecondSignIn.getScene().getWindow();
                        
			signInStage.close();
                      
                        
                        
		}
	}

	private String[] gatherSignInInfo() {
		String[] mytime = new DataBank().getDateAndTime(); // get the time array
															// from Databank //
															// class
		String first = tfFirstName.getText();
		String middle = tfInitial.getText();
		String last = tfLastName.getText();
		String courseName = cbCourse.getValue();
		String instructorName = cbInstructor.getValue();
		String[] signInDetails = { first, middle, last, courseName,
				instructorName, mytime[0], mytime[1], mytime[2] };
		return signInDetails;
	}

	public void putIntoDB(String[] info) {
		Connection conn = null;
		String firstName = info[0];
		String initial = info[1];
		String lastName = info[2];
		String course = info[3];
		String instructor = info[4];
		String entry_day = info[5];
		String entry_time = info[6];
		String entry_date = info[7];

		String sql = "INSERT INTO signin(firstName,initial,lastName,"
				+ "course,instructor,entry_day,entry_time,entry_date)"
				+ " VALUES('" + firstName + "','" + initial + "','" + lastName
				+ "','" + course + "','" + instructor + "','" + entry_day
				+ "','" + entry_time + "','" + entry_date + "')";

		try {
			final String userName = "DbUserName"; // database username
			final String passWord = "myPass"; // database password
			final String url = "jdbc:mysql://localhost/students"; // address to students Db
																	
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection(url, userName, passWord); // get connection
																			
			// System.out.println("Database connection successful");
			Statement stmt = conn.createStatement();
			System.out.println("connection successfully");
			stmt.executeUpdate(sql);
			// System.out.println("statement executed");
			conn.close();
			System.out.println("updated successfully");
		} catch (Exception e) {
			System.out.println("update failed");
		}

	} // end of putIntoDB

	// pattern matcher for enteries
	public static boolean findPattern(String names) {
		// String to be scanned to find the pattern.
		String line = names;
		String pattern = "[^a-zA-Z\\-]";
		// String pattern = "\\W" ; //+ "(.*)(\\d+)(.*)";
		// Create a Pattern object
		Pattern r = Pattern.compile(pattern);
		// create matcher object.
		Matcher m = r.matcher(line);
		if (m.find()) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public void initialize(URL arg0, ResourceBundle arg1) {
		// combo boxes initialized
		cbCourse.setItems(new DataBank().listOfCourses);

		cbInstructor.setItems(new DataBank().listOfInstructors);
	}

}
