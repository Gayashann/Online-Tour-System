<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.model.payment.PaymentDetails" %>
<%@ page import="com.model.payment.Payment" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Service</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="stylesheet" href="styles/headerfooter.css"/>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Tangerine:wght@400;700&display=swap" rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Pacifico&family=Tangerine:wght@400;700&display=swap" rel="stylesheet">


  <style>
body {
  background-image: url("img/flat.jpg");
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
}
form {
    width: 300px;
    margin: 20px auto;
    background-color: #f0f0f0;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

input[type="text"], input[type="number"], input[type="submit"] {
    display: block;
    margin-bottom: 10px;
    width: calc(100% - 20px); /* Adjust for padding */
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box; /* Include padding in width calculation */
}

label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
}

select {
    display: block;
    margin-bottom: 10px;
    width: calc(100% - 20px); /* Adjust for padding */
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box; /* Include padding in width calculation */
}

input[type="submit"] {
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 5px;
    padding: 10px 20px;
    cursor: pointer;
    font-size: 16px;
}

input[type="submit"]:hover {
    background-color: #45a049;
}

</style>
</head>
<body>
<div class="menubar">
			<button type="submit"class="btnlogin" ><a href="#">LogOut</a></button>

			<div class="leftmenu">
				<h1 class="text" >Online Tour system</h1>
			</div>
			<ul>
			<li style="font-size:20px"> <a href="home.jsp"> Home </a> </li>
				<li style="font-size:20px"> <a href="allProperties.jsp"> Properties </a> </li>
				<li style="font-size:20px"> <a href="About.jsp">About Us </a> </li>
				<li style="font-size:20px"> <a href="services.jsp">Services </a> </li>
				<li style="font-size:20px">  <a href="contactus.jsp">Contact Us </a> </li>
			</ul>
		</div>
		<hr>

    <div class="navi">
        <ul class="list">
        
        </ul>
    </div>
    <div class="container">
  
        <%
            Payment payment = (Payment) request.getAttribute("PaymentDetails");
        %>
        <form action="UpdatePaymentServlet" method="POST">
		    <div class="form-group">
		    	<label ><b>Payment ID</b></label>
		        <input type="text" name="paymentId" value="<%= payment.getPayment_id() %>" readonly>
		    </div>
		    <div class="form-group">
		    	<label ><b>Card Holder Name</b></label>
		        <input type="text" name="paymentPrice" value="<%= payment.getCardHolder() %>" readonly>
		    </div>
		    <div class="form-group">
		    	<label ><b>Card Number</b></label>
		        <input type="text" name="paymentEmail" value="<%= payment.getCardNo() %>" readonly>
		    </div>
		    <div class="form-group">
		    	<label ><b>CVV</b></label>
		        <input type="text" name="paymentAge" value="<%= payment.getCvv() %>" readonly>
		    </div>
		    <div class="form-group">
		    	<label ><b>Expire Date</b></label>
		        <input type="text" name="paymentEvent" value="<%= payment.getExpDate() %>" readonly>
		    </div>
		    <div class="form-group">
		    	<label ><b>Property Name</b></label>
		        <input type="text" name="paymentFirstName" value="<%= payment.getPropertyName() %>" readonly>
		    </div>

		    <div class="form-group">
		    	<label ><b>Status</b></label>
			    <select name="paymentAccept">
			        <option value="accepted" <%= payment.getAccept().equals("accepted") ? "selected" : "" %>>Accepted</option>
			        <option value="rejected" <%= payment.getAccept().equals("rejected") ? "selected" : "" %>>Rejected</option>
			        <option value="pending" <%= payment.getAccept().equals("pending") ? "selected" : "" %>>Pending</option>
			    </select>
			</div>
		    <div class="form-group">
		        <input type="submit" value="Update">
		    </div>
		</form>
    </div>
 
    
</body>
</html>
