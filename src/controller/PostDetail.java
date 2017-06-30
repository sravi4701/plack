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
 * Servlet implementation class PostDetail
 */
@WebServlet("/PostDetail")
public class PostDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

    

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.println("...........................");
		String post = request.getParameter("post");
		out.println("...........................");
		out.println(post);
		if (post != null && !post.equals("")) {
		    System.out.println("ok");
		}
		else{
			response.sendRedirect("Post.jsp");
		}
			HttpSession s = request.getSession();
			String currentUser = (String)s.getAttribute("email");
			
			System.out.println(currentUser);
			Connection cn = GetConnection.getCn();
			System.out.println(post);
			try{
				String sql = "insert into post(useremail, text, postdate) values(?,?,NOW())";
				PreparedStatement ps = cn.prepareStatement(sql);
				ps.setString(1, currentUser);
				ps.setString(2, post);
				System.out.println(post);
				System.out.println(currentUser);
				ps.execute();
				System.out.println(post);
				System.out.println(currentUser);
				System.out.println("data inserted successfully");
				ps.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
}
