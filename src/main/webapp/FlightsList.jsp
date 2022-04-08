<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.database.dbUtil"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flight details</title>
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
</style>
</head>
<body>
	<table>
		<tr>
			<th>Flight No</th>
			<th>Airline Name</th>
			<th>Source</th>
			<th>Destination</th>
			<th>Departure Time</th>
			<th>Ticket Price</th>
		</tr>
		<%
		try{
			Connection connection = dbUtil.getConnection();

			String sqlQuery = "select flightno,airline,origin,destination,departure_time,fare from flightdetails";
			PreparedStatement pstmt = connection.prepareStatement(sqlQuery);

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
		%>
		<tr>

			<td><%=rs.getString("flightno")%></td>
			<td><%=rs.getString("airline")%></td>
			<td><%=rs.getString("origin")%></td>
			<td><%=rs.getString("destination")%></td>
			<td><%=rs.getString("departure_time")%></td>
			<td><%=rs.getString("fare")%></td>
		</tr>


		<%
			}
		%>
		<%
			} catch (Exception e) {
		// TODO: handle exception
		}
		%>
	</table>
	<br>
	<br>
	 <a href="AdminHome.jsp"><button >Go back to home page</button></a>
</body>
</html>