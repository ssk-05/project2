<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.database.dbUtil"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Unique Places</title>
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
			<th>Source</th>
			<th>Destination</th>
		</tr>
		<%
		try{
			Connection connection = dbUtil.getConnection();

			String sqlQuery = "select origin,destination from flightdetails";
			PreparedStatement pstmt = connection.prepareStatement(sqlQuery);

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("origin")%></td>
			<td><%=rs.getString("destination")%></td>
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