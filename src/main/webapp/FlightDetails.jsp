<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.database.dbUtil"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flight Details</title>
<style>
table {
  border-collapse: collapse;
  width: 70%;
}

th, td {
  text-align: center;
  padding: 8px;
}

tr:nth-child(even){border-bottom : 1px solid #ccc;}
tr:nth-child(odd){border-bottom : 1px solid #ccc;}
</style>
</head>
<body>
<div>
<div >
	<h1>FlyAway</h1>
</div>
</div>
<div>
		<table>
			<tr>
				<th>Flight no</th>
				<th>Origin</th>
				<th>Destination</th>
				<th>Departure Time</th>
				<th>Arrival Time</th>
				<th>Fare</th><th></th>
			</tr>


			<%
	String origin = (String) request.getAttribute("origin");
	String des = (String) request.getAttribute("destination");
	String date=(String)request.getAttribute("date");
	String totalPerson=(String)request.getAttribute("totalPerson");
	

	try {
		Connection con = dbUtil.getConnection();
		String sql = "select * from flightdetails where origin=? and destination=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, origin);
		pstmt.setString(2, des);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			session.setAttribute("fare", rs.getString("fare"));
			session.setAttribute("departure_time",  rs.getString("departure_time"));
			session.setAttribute("arrival_time",rs.getString("arrival_time"));

	%>

			<tr>
				<td><%= rs.getString("flightno") %></td>
				<td><%= rs.getString("origin")%></td>
				<td><%= rs.getString("destination")%></td>
				<td><%= rs.getString("departure_time")%></td>
				<td><%= rs.getString("arrival_time")%></td>
				<td><%= rs.getString("fare")%></td>
				
				<td> <a href="login.jsp?flightno=<%= rs.getString("flightno") %>"><b>Book Now</b></a></td>
				
			</tr>


			<%
				}
			} catch (Exception e) {
			out.print("Something went wrong, please try again later");
			}
			%>
		</table>
</div>
</body>
</html>