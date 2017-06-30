package controller;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import getData.GetConnection;
/**
 * Servlet implementation class Testsql
 */
@WebServlet("/Testsql")
public class Testsql extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Testsql() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		
		Connection cn = GetConnection.getCn();
		String query = "select * from test";
		try {
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()){
			out.println(rs.getString(1)+" "+rs.getString(2)+" "+rs.getString(3));
			}
			cn.close();
			} catch (Exception e) {
			System.out.println(e);
		}
}


}