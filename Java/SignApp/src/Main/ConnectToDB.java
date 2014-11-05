/**
 *
 * @author Hayford
 */

package Main;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ConnectToDB {

	public static void createTables() {
		Connection conn = null;
		String inTable = "CREATE TABLE signin ("
				+ "firstName varchar(20) NOT NULL," + "initial varchar(2),"
				+ "lastName varchar(20) NOT NULL," + "course varchar(50),"
				+ "instructor varchar(30)," + "entry_day varchar(15),"
				+ "entry_time varchar(15)," + "entry_date varchar(15))";

		String outTable = "CREATE TABLE signout("
				+ "firstName varchar(20) NOT NULL," + "initial varchar(2),"
				+ "lastName varchar(20) NOT NULL," + "comment varchar(500),"
				+ "exit_day varchar(15)," + "exit_time varchar(15),"
				+ "exit_date varchar(15))";

		try {
			final String userName = "DbUserName"; // database username
			final String passWord = "myPass"; // database password
			final String url = "jdbc:mysql://localhost/students"; // address to students Db
																	// 

			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection(url, userName, passWord); // get connection
																			
			// System.out.println("Database connection successful");
			Statement stmt = conn.createStatement();
			stmt.executeUpdate("drop table if exists signin");
			stmt.executeUpdate(inTable);
			stmt.executeUpdate("drop table if exists signout");
			stmt.executeUpdate(outTable);
			conn.close();
			System.out.println("tables created sucessfully");
		} catch (Exception e) {
			System.out.println("creation of tables failed");
		}

	}

}
