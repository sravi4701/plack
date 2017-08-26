package controller;


import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import getData.GetConnection;


/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		String pass = request.getParameter("pass").trim();
		Connection cn = GetConnection.getCn();
		HttpSession session = request.getSession();
		try{
			String sql = "select * from user where useremail=?";
			
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				String passd = rs.getString(3).trim();
				if(pass.equals(passd)){
					session.setAttribute("email", rs.getString(1));
					session.setAttribute("name", rs.getString(2));
					response.sendRedirect("Profile.jsp");
				}
				else{
					out.println("password did not match");
				}
			}
			else{
				out.println("Login.java : no record found");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}