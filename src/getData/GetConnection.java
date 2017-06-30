package getData;

import java.sql.*;  
public class GetConnection{
		static String driver = "com.mysql.jdbc.Driver";
		static String url = "jdbc:mysql://localhost:3306/plack";
		static String user = "root";
		static String pass = "root";
		static Connection cn = null;
		
		public static Connection getCn(){
			try{
				Class.forName(driver);
				cn = DriverManager.getConnection(url, user, pass);
			}
			catch(Exception e){
				System.out.println(e);
			}
			return cn;
		}
	}