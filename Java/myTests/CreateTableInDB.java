
import java.sql.*;
public class CreateTableInDB {	
	// JDBC driver name and database URL
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	static final String DB_URL = "jdbc:mysql://localhost/";

	//  Database credentials
	static final String USER = "root";
	static final String PASS = "mypass";
	public static void main(String[] args){

		Connection conn = null;
		Statement stmt = null;
		try{
			//register jdbc
			Class.forName("com.mysql.jdbc.Driver");

			// Opent db connection
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);

			// create and execute a query
			System.out.println("Creating database...");
			stmt = conn.createStatement();

			String sql = "CREATE DATABASE STUDENTS";
			stmt.executeUpdate(sql);
			System.out.println("Database created successfully...");
		}catch(SQLException se){
			// JDBC error handling
			se.printStackTrace();
		}catch(Exception e){
			//handle errors for Class.forName
			e.printStackTrace();
		}finally{
			//finally close resources
			try{
				if(stmt!=null)
					stmt.close();
			}catch(SQLException se2){
			}// do nothing
			try{
				if(conn!=null)
					conn.close();
			}catch(SQLException se){
				se.printStackTrace();
			}//end finally try
		}//end try
		System.out.println("Goodbye!");
	}//end main
}//end CreateTableInDB
 










