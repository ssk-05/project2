<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.database.dbUtil"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Airline List</title>
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
			<th>Airlines</th>
		</tr>
		<%
		try {
			Connection connection = dbUtil.getConnection();

			String sqlQuery = "select flightno,airline from flightdetails";
			PreparedStatement pstmt = connection.prepareStatement(sqlQuery);

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("flightno")%></td>
			<td><%=rs.getString("airline")%></td>
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
	<a href="AdminHome.jsp"><button>Go back to home page</button></a>
</body>

</html>