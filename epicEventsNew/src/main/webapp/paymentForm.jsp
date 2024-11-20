<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--Navigation Bar fonts-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="styles/headerfooter.css"/>
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Dancing+Script&family=Josefin+Sans:ital,wght@1,100..700&family=Parisienne&family=Tangerine:wght@400;700&family=Zeyada&display=swap" rel="stylesheet">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Dancing+Script&family=Josefin+Sans:ital,wght@1,100..700&family=Parisienne&family=Tangerine:wght@400;700&family=Zeyada&display=swap" rel="stylesheet">
		
    <meta charset="UTF-8">
    <title>Credit Card Payment</title>
    <link rel="stylesheet" type="text/css" href="styles/paymentForm.css">
  <style>
body {
  background-image: url("img/2.jpeg");
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
}
</style>
<script>
        function validateForm(event) {
            // Get form elements
            const cardNumber = document.getElementById('cardNumber').value;
            const cvv = document.getElementById('cvv').value;

            // Validate card number (16 digits)
            const cardNumberRegex = /^\d{16}$/;
            if (!cardNumberRegex.test(cardNumber)) {
                alert('Please enter a valid 16-digit credit card number.');
                event.preventDefault();
                return false;
            }

            // Validate CVV (3 digits)
            const cvvRegex = /^\d{3}$/;
            if (!cvvRegex.test(cvv)) {
                alert('Please enter a valid 3-digit CVV.');
                event.preventDefault();
                return false;
            }

            // If all validations pass
            return true;
        }

        document.addEventListener('DOMContentLoaded', (event) => {
            document.querySelector('form').addEventListener('submit', validateForm);
        });
    </script>

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
  
    <form action="ProcessPaymentServlet" method="post">
        <label for="paymentType">Payment Type:</label>
        <select id="paymentType" name="paymentType" required>
            <option value="credit">Credit Card</option>
            <option value="debit">Debit Card</option>
            <option value="paypal">PayPal</option>
        </select>

        <label for="propertyType">Property Name</label>
        <select id="propertyType" name="propertyType" required>
            <option value="Eco">Eco</option>
            <option value="Sea">Sea</option>
            <option value="Lake">Lake</option>
            <option value="Home">Home</option>
            <option value="City">City</option>
            <option value="paypal">PayPal</option>
        </select>

        <label for="cardHname">Card Holder's Name:</label>
        <input type="text" id="cardHname" name="cardHname" required>

        <label for="cardNumber">Card Number:</label>
        <input type="number" id="cardNumber" name="cardNumber" placeholder="Enter card number" required>

        <label for="expiryDate">Expiry Date:</label>
        <input type="month" id="expiryDate" name="expiryDate" required>

        <label for="cvv">CVV:</label>
        <input type="number" id="cvv" name="cvv" placeholder="Enter CVV" required>

        <input type="submit" value="Pay Now">
    </form>
   
</body>
</html>
