<%@ page import="java.util.List" %>
<%@ page import="com.model.payment.Payment" %>
<%@ page import="com.database.PaymentData" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles/headerfooter.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Payments Details</title>
    <!-- CSS Styles -->
    <style>
    
table {
  width: 100%;
  border-collapse: collapse;
}

th {
  background-color: #f2f2f2;
  color: #333;
  padding: 8px;
  text-align: left;
  border-bottom: 2px solid #ddd;
}

tr {
  background-color: #f9f9f9;
}

td {
  padding: 8px;
  border-bottom: 1px solid #ddd;
}
body {
  background-image: url("img/success.jpg");
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
}
    </style>
    <!-- External CSS Links -->
    <link rel="stylesheet" href="updatePayment.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Didact+Gothic&family=Madimi+One&display=swap" rel="stylesheet">
    

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
    <!-- Header -->
  

    <!-- Main content -->
    <main>
        <div class="container">
            <table>
                <thead>
                    <tr>
                        <th>Payment Id</th>
                        <th>Card Holder</th>
                        <th>Card No</th>
                        <th>CVV</th>
                        <th>Expire Date</th>
                        <th>Property Name</th>
                        <th>Accept</th>
                        <th>Update</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        PaymentData paymentData = new PaymentData();
                        List<Payment> userPayments = paymentData.getUserPayments();
                        
                        for (Payment payment : userPayments) { 
                    %>
                        <tr>
                            <td><%= payment.getPayment_id() %></td>
                            <td><%= payment.getCardHolder() %></td>
                            <td><%= payment.getCardNo() %></td>
                            <td><%= payment.getCvv() %></td>
                            <td><%= payment.getExpDate() %></td>
                            <td><%= payment.getPropertyName() %></td>
                            <td><%= payment.getAccept() %></td>
                            <td> 
                                <div class="update-form">
                                    <form action="UpdatePaymentByIdServlet" method="POST">
                                        <input type="hidden" name="paymentId" value="<%= payment.getPayment_id() %>">
                                        <input type="hidden" name="cardHname" value="<%= payment.getCardHolder() %>">
                                        <input type="hidden" name="CardNo" value="<%= payment.getCardNo() %>">
                                        <input type="hidden" name="cvv" value="<%= payment.getCvv() %>">
                                        <input type="hidden" name="expDate" value="<%= payment.getExpDate() %>">
                                        <input type="hidden" name="propertyName" value="<%= payment.getPropertyName() %>">
                                        <input type="hidden" name="accept" value="<%= payment.getAccept() %>">
                                        <button type="submit" class="animated-button1"> 
                                            <span>Update</span>
                                            <span></span> 
                                        </button>
                                    </form>
                                </div>
                            </td>
                            <td>
                                <form action="DeletePaymentServlet" method="POST">
                                    <input type="hidden" name="paymentId" value="<%= payment.getPayment_id() %>">           
                                    <button class="animated-button2"> 
                                        <span>Delete</span>
                                        <span></span> 
                                    </button>
                                </form>      	
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </main>


</body>
</html>
