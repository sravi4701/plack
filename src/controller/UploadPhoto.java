package controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import getData.GetConnection;

/**
 * Servlet implementation class UploadPhoto
 */
@WebServlet("/UploadPhoto")
public class UploadPhoto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadPhoto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String currentUser = request.getParameter("id");
		
		Connection cn = GetConnection.getCn();
		boolean flag = false;
		try{
			String sql = "select image from dashboard where useremail=?";
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setString(1, currentUser);
			ResultSet rs = ps.executeQuery();
			Blob image = null;
			byte [] imgData = null;
			if(rs.next()){
				image = rs.getBlob(1);
				if(image != null){
					imgData = image.getBytes(1, (int)image.length());
	//				InputStream input = rs.getBinaryStream("photo");
					OutputStream output = response.getOutputStream();
					response.setContentType("image/gif");
					output.write(imgData);	
				}
				else{
					flag=true;
				}
			}
			else{
				flag=true;
			}
			if(flag){
				response.setContentType("image/gif");  
			    ServletOutputStream out;  
			    out = response.getOutputStream();  
			    FileInputStream fin = new FileInputStream("/home/ravishankar/workspace/plack/WebContent/img/default.png");
			    BufferedInputStream bin = new BufferedInputStream(fin);  
			    BufferedOutputStream bout = new BufferedOutputStream(out);  
			    int ch =0;
			    while((ch=bin.read())!=-1)  
			    {  
			    bout.write(ch);  
			    }  
			      
			    bin.close();  
			    fin.close();  
			    bout.close();  
			    out.close();
				System.out.println("UploadPhoto.java: no record found");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}
