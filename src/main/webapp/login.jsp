<%@page import="com.servlet.loginServlet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login</title>
</head>
<body>
<div>
	<h1>FlyAway</h1>
</div>
	<%
	String flightn = request.getParameter("flightno");
        session.setAttribute("flightno", flightn);
	%>
<div>	
<div>
<h2>Login Here</h2>
</div>
	<form action="loginServlet" method="post">
		<label><b>Enter username : </b></label><br/>
		<input type="email" name="email" required="required"><br>
		<label><b>Enter password : </b></label><br/>
		<input type="password" name="password"
			required="required"><br>
		<button type="submit"><b>Submit</b></button>
		<br>
		<p>
			New User? <a href="register.html?flightno=<% session.setAttribute("flightno",flightn);%>">Register here</a>
		</p>
	</form>
</div>
</body>
</html>