package com.servlet;

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

import com.database.dbUtil;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ChangePassword() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String newPassword = (String) request.getParameter("newPassword");
		String currentPassword = request.getParameter("currentPassword");
		String confirmPassword = request.getParameter("confirmPassword");
		String email = request.getParameter("email_id");
		final String SELECT_SQL = "SELECT * FROM admindetails";
		final String UPDATE_SQL = "UPDATE admindetails SET password = '" + newPassword+ "' WHERE email_id = '" + email + "'";
		try {
			Connection connection = dbUtil.getConnection();
			Statement statement = connection.createStatement();
			ResultSet rs_select = statement.executeQuery(SELECT_SQL);
			PrintWriter out = response.getWriter();
			if (rs_select.next()) {
				if (newPassword.equals(confirmPassword)) {
					statement.executeUpdate(UPDATE_SQL);
					out.println("Password updated Successfully");
					out.println(
							"<p> Please go back to <a href=\"/FlyawayPhase2/adminlogin.jsp\">Login Screen</a> and login with you new password </p>");
				} 
				else {
					out.println("<h3> Password Mismatch</h3>");
					out.println("<p> Passowrds don't match </p>");
				}
			} else {
				out.println("<h3> Unauthorized User</h3>");
				out.println("<p> Login ID and/or Password incorrect </p>");
			}

			rs_select.close();
			statement.close();
			connection.close();
		} catch (Exception e) {

			e.printStackTrace();
		}

	}

}
