<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.database.dbUtil"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
</head>
<body>

	<form action="AdminloginServlet" method="post">
		USERNAME : <input type="email" name="username" required="required"><br>
		PASSWORD : <input type="password" name="password" required="required"><br>
		<button type="submit">Login</button>
	</form>

</body>
</html>