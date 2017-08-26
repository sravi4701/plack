package controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import getData.GetConnection;

/**
 * Servlet implementation class FileUpload
 */
@WebServlet("/FileUpload")
@MultipartConfig(maxFileSize = 16177215)
public class FileUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileUpload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s = request.getSession(false);
		String currentUser = (String)s.getAttribute("email");
		InputStream inputStream = null;
		Part filePart = request.getPart("photo");
		System.out.println("FileUpload.java " + currentUser);
		if(filePart != null){
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());
			inputStream = filePart.getInputStream();
		}
		Connection cn = GetConnection.getCn();
		try{
			String sql = "update dashboard set image=? where useremail=?";
			PreparedStatement ps = cn.prepareStatement(sql);
			if(inputStream != null){
				ps.setBlob(1, inputStream);
			}
			ps.setString(2, currentUser);
			int c = ps.executeUpdate();
			if(c > 0){
				System.out.println("sucess");
				response.sendRedirect("Profile.jsp");
			}
			else{
				System.out.println("FileUpload.java : " + "no record found");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}
