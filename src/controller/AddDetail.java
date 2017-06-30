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
		//		PrintWriter out = response.getWriter();
		String dob = request.getParameter("dob");
		String college = request.getParameter("college");
		String furl = request.getParameter("furl");
		String turl = request.getParameter("turl");
		String bio = request.getParameter("bio");
		String quote = request.getParameter("quote");
		HttpSession s = request.getSession();
		String currentUser = (String)s.getAttribute("email");
		System.out.println(currentUser);
		Connection cn = GetConnection.getCn();
		try{

			String sql = "update dashboard set dob=?, college=?, furl=?, turl=?, bio=?, quote=? where useremail=?";
			PreparedStatement ps = cn.prepareStatement(sql);
			System.out.println("data inserted successfully");
			ps.setString(1, dob);
			ps.setString(2, college);
			ps.setString(3, furl);
			ps.setString(4, turl);
			ps.setString(5, bio);
			ps.setString(6, quote);
			ps.setString(7, currentUser);
			ps.executeUpdate();
			response.sendRedirect("index.jsp");
			System.out.println("data inserted successfully");
			ps.close();	
		}
		catch(Exception e){
			System.out.println(e);
		}
	}
}