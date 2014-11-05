/**
 *
 * @author Hayford
 */
package Main;

import java.text.SimpleDateFormat;
import java.util.Date;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

public class DataBank {

public static ObservableList<String> listOfInstructors = FXCollections
			.observableArrayList("Prof 1", "prof 2", "prof 3", "prof 4",
					"prof 5", "prof 6", "prof 7", "prof 8", "prof 9", "prof 10");
	
public static ObservableList<String> listOfCourses = FXCollections.observableArrayList(
			"College Algebra", "Calculus 1", "Trignometry",
			"Applied calc for Life Sci", "Quantitative Literacy", "Calculus 2",
			"Plane Geometry and Trig", "course 8", "course 9", "course 10",
			"course 11", "course 12", "course 13", "course 14", "course 15",
			"course 16", "course 17", "course 18");

	// method to extract system date and time
	public String[] getDateAndTime() {
		Date DateAndTime = new Date();
		SimpleDateFormat ft = new SimpleDateFormat(
				"E MM/dd/yyyy 'at' hh:mm:ss a");
		String dateTime = ft.format(DateAndTime);		
		String[] dateDetails = {dateTime.substring(0, 3),dateTime.substring(18, 29),
				dateTime.substring(4, 14)};
		return dateDetails;
	}
		
}
