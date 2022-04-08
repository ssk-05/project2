package com.servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HomePageServlet
 */
@WebServlet("/HomePageServlet")
public class HomePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public HomePageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String origin=request.getParameter("origin");
		String Destination=request.getParameter("destination");
		String date=request.getParameter("date");
		String totalPerson=request.getParameter("totalPerson");
		
		
		String url="jdbc:mysql://localhost:3306/flyaway";
		String username="root";
		String password="Sweta@1996";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			String sql="select * from flightdetails where origin=? and destination=?";
			PreparedStatement pstmt=con.prepareStatement(sql);
			pstmt.setString(1, origin);
			pstmt.setString(2, Destination);
		
			/*
			 * ResultSet rs=pstmt.executeQuery(); PrintWriter out=response.getWriter();
			 */
	
			
			con.close();

			/* Flights flightdetail=new Flights(); */
			request.setAttribute("origin", origin);
			request.setAttribute("destination", Destination);
			request.setAttribute("date", date);
			request.setAttribute("totalPerson", totalPerson);
			

		RequestDispatcher dispatcher=request.getRequestDispatcher("/FlightDetails.jsp");
		dispatcher.forward(request, response);
			
		}catch (Exception e) {
		System.out.println("Some Error occured in connection, please try again later");
		}
	}

}
