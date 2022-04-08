<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.database.dbUtil"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password</title>
</head>
<body>
	<form action="ChangePassword" method="post">
		<table>
			<tbody>
				<tr>
					<td>Admin ID :</td>
					<td><input type="text" name="email_id"></td>
				</tr>
				<tr>
					<td>Current Password :</td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td>New Password :</td>
					<td><input type="password" name="newPassword"></td>
				</tr>
				<tr>
					<td>Confirm New Password :</td>
					<td><input type="password" name="confirmPassword"></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><input type="submit" value="Change Password"
						name="btnChgPw"> &nbsp; <input type="reset" value="Clear"
						name="btnCLear"></td>
				</tr>
		</table>
	</form>
</body>
</html>