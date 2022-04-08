
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment</title>
</head>
<body>
	<div>
		<h1>FlyAway</h1>
	</div>
	<%
	Object flight = session.getAttribute("flightno");
	%>
	<div >
		<div>
			<h2>Make Payment</h2>
		</div>
		<form action="BookingDetails.jsp" method="post">
			<label style="padding-right: 60px;" >Enter Card No :</label> 
			<input type="text" name="cardno" maxlength="25" placeholder="Card Number"><br /> 
			<label>Enter Card Holder Name :</label> 
			<input type="text" name="nameoncard" placeholder="Name on card"><br /> 
			<label style="padding-right: 30px;">Expiry date :</label>
			 <span><select name=month><option>Month</option>
					<%
					for (int i = 1; i <= 12; i++) {
					%>
					<option value="<%out.println(i);%>">
						<%
						out.println(i);
						%>
					</option>
					<%
					}
					%>
			</select> <select name=year>Year
					<option>Year</option>
					<%
					for (int i = 2022; i <= 2030; i++) {
					%>
					<option value="<%out.println(i);%>">
						<% out.println(i);%>
					</option>
					<%
					}
					%>
			</select></span><br> <label style="padding-right: 60px;"> Enter cvv :</label> 
			<input type="password" name="cvv" placeholder=" Enter your cvv" maxlength="3"> <br>
			<button type="submit" name="submit">Pay</button>
		</form>
	</div>
</body>
</html>