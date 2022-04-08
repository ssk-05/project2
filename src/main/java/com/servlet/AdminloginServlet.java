package com.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.dbUtil;

//Servlet for Admin login
@WebServlet("/AdminloginServlet")
public class AdminloginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminloginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session=request.getSession();
		String username = (String) request.getParameter("username");
		String password = (String) request.getParameter("password");
		PrintWriter out = response.getWriter();
		final String SELECT_SQL = "SELECT * FROM admindetails";

		try {
			Connection connection = dbUtil.getConnection();
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(SELECT_SQL);
			boolean match = false;

			while (rs.next()) {
				if (username.equals(rs.getString("email_id")) && password.equals(rs.getString("password"))) {
					match = true;
					out.println("<p>Logged in successfully</p>");
					out.println("<p> Please go to <a href=\"/FlyawayPhase2/AdminHome.jsp\">Login Screen</a></p>");
				} else {
					out.println("<h3> Unauthorized User</h3>");
					out.println("<h4> Please go back and try again</h4>");
				}
			}

			rs.close();
			statement.close();
			connection.close();
			out.println("</body>");
			out.println("</html>");

		} catch (Exception e) {

			e.printStackTrace();
		}
	}
}
