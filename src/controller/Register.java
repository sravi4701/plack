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
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		Long phone = Long.parseLong(request.getParameter("phone"));
		String pass1 = request.getParameter("pass1");
		String pass2 = request.getParameter("pass2");
		Connection cn = GetConnection.getCn();
		
		try {
			String sql = "insert into user values(?,?,?,?)";
			PreparedStatement  ps = cn.prepareStatement(sql);
			
			ps.setString(1, email);
			ps.setString(2, name);
			ps.setString(3, pass1);
			ps.setLong(4, phone);
			
			boolean x = ps.execute();
			System.out.println(x);
			if(!x){
				System.out.println("Data Inserted Successfully");
				
				response.sendRedirect("Afterregister.jsp");
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
	}
    

}