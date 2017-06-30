package controller;


import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import getData.GetConnection;

/**
 * Servlet implementation class AddDetail
 */
@WebServlet("/AddDetail")
public class AddDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String furl = request.getParameter("furl");
		String quote = request.getParameter("quote");
	

		
			HttpSession s = request.getSession();
			String currentUser = (String)s.getAttribute("email");
			
			System.out.println(currentUser);
			Connection cn = GetConnection.getCn();
			try{
			    
				String sql = "insert into dashboard(useremail,facebookurl,quote) values(?,?,?)";
				PreparedStatement ps = cn.prepareStatement(sql);
				System.out.println("data inserted successfully");
				ps.setString(1, currentUser);
				ps.setString(2, furl);
				ps.setString(3, quote);
				ps.execute();
				response.sendRedirect("index.jsp");
				System.out.println("data inserted successfully");
				ps.close();	

		}
		catch(Exception e){
			System.out.println(e);
		}
	}
}