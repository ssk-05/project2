<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
</head>
<body>
	<div>
		<h2>FlyAway</h2>
	</div>
	<div>
		<h2>
			<%
			String email = (String) session.getAttribute("email_id");
			out.println("Welcome to Admin Page");
			%>
		</h2>
	</div>
	<div style="text-align:center">
		<h3>
			<a href="changePassword.jsp">Change Password</a>&nbsp; 
			<a href="Places.jsp">List of Places</a>&nbsp; 
			<a href="AirlineList.jsp">List of Airlines</a>&nbsp;
			<a href="FlightsList.jsp">List of Flights</a>
		</h3>
	</div>
	<br>
	<a href="Home.html" ><button>Logout</button></a>
</body>
</html>