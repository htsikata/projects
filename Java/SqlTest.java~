// setting up jdbc driver (on my ubuntu)
import java.sql.*;
public class SqlTest {

	public static void main(String[] args) {
		
		try{
			Driver d = (Driver)Class.forName("com.mysql.jdbc.Driver").newInstance();
			
			System.out.println("database driver works!");
			
		}catch(Exception e){
			System.out.println("database driver doesn't work.");
		}		
	}

}
