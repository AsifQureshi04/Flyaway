<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Fly Away | LogIn</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="navstyle.css">
<link rel="stylesheet" href="bdystyle.css">
<link rel="stylesheet" href="bookflightstyle.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	integrity="sha512-..." crossorigin="anonymous">
	
<style>
p, h5, h6, i {
	justify-content: center;
	text-align: center;
	display: flex;
	color: white;
}

span {
	justify-content: center;
	text-align: center;
	display: flex;
}
</style>
<script>
	function printDiv(divId){
		var printContents = document.getElementById(divId).innerHTML;
		var originalContents = document.body.innerHTML;
		document.body.innerHTML = printContents;
		window.print();
		document.body.innerHTML = originalContents;
	}
	
	function logout(){
		var xhr = new XMLHttpRequest();
		xhr.open("GET","LogoutServlet",true);
		xhr.onreadystatechange = function(){
			if(xhr.readyState === 4){
				if(xhr.status === 200){
					window.location.href = "index.jsp";
				}else{
					alert("Error: Unable to logout.");
				}
			}
		};
		xhr.send();
	}
	
	function submitForm(){
		document.getElementById('fetchForm').submit();
	}
	
	function redirectToPage(){
		window.loacation.href = "bookflight.jsp";
	} 
</script>

</head>
<body>
	<!-- Navbar start -->
	<nav class="navbar">
		<div class="left">
			<i class="fas fa-plane fa-3x"
				style="color: blue; display: flex; margin-left: -380px;"></i>
		</div>
		<div class="right">
			<input type="checkbox" id="check"> <label for="check"
				class="checkBtn"> <i class="fa fa-bars"></i>
			</label>
			<ul class="list">
				<li>
					<form id="fetchForm" action="CustomerDetailsServlet"
						method="post">
						<a href="#" onclick="submitForm()">CUSTOMER DETAILS</a>
					</form>
				</li>
				<li><a href="#">CHANGE PASSWORD</a></li>
				<li><i class="fas fa-sign-out-alt"></i></li>
				<li><a href="#" onclick="logout()">LOGOUT</a></li>
			</ul>
		</div>
	</nav>
	<!-- Navbar end -->

	<br style="height: 1500px;">
	<button type="button" class="btn btn-primary"
		onclick="redirectToPage()">Book a new journey</button>
	<div class="col-md-8" style="margin: auto;">
	  <div id="printContent">
		<h1 style="text-align: center;">TICKET DETAILS</h1>
		<br>
		<div class="shadow-lg p-3 mb-5 bg-white rounded"
			style="border: none; background-color: blue; color: black;">
			<div class="input-group">
				<h6 style="color: black; margin-right: 80px;">
					<strong>Booking Id:</strong>
				</h6>
				<h6 style="color: black; margin-left: 105px;">${sessionScope.booking_id}</h6>
			</div>
			<br>
			<div class="input-group">
				<h6 style="color: black; margin-right: 80px;">
					<strong>Flight Number:</strong>
				</h6>
				<h6 style="color: black; margin-left: 80px;">${ticketDetails.getFlight_Number()}</h6>
			</div>
			<br>
			<div class="input-group">
				<h6 style="color: black; margin-right: 109px;">
					<strong>Airline:</strong>
				</h6>
				<h6 style="color: black; margin-left: 109px;">${ticketDetails.getAirline()}</h6>
			</div>
			<br>
			<div class="input-group">
				<h6 style="color: black; margin-right: 91px;">
					<strong>Travel Class:</strong>
				</h6>
				<h6 style="color: black; margin-left: 91px;">${ticketDetails.getFlight_class()}</h6>
			</div>
			<br>
			<div class="input-group">
				<h6 style="color: black; margin-right: 107px;">
					<strong>Source:</strong>
				</h6>
				<h6 style="color: black; margin-left: 107px;">${ticketDetails.getSrc()}</h6>
			</div>
			<br>
			<div class="input-group">
				<h6 style="color: black; margin-right: 90px;">
					<strong>Destination:</strong>
				</h6>
				<h6 style="color: black; margin-left: 90px;">${ticketDetails.getDest()}</h6>
			</div>
			<br>
			<div class="input-group">
				<h6 style="color: black; margin-right: 90px;">
					<strong>Travel Date:</strong>
				</h6>
				<h6 style="color: black; margin-left: 90px;">${ticketDetails.getDate()}</h6>
			</div>
			<br>
			<div class="input-group">
				<h6 style="color: black; margin-right: 67px;">
					<strong>No. of Passengers:</strong>
				</h6>
				<h6 style="color: black; margin-left: 67px;">${ticketDetails.getNo_of_passengers()}</h6>
			</div>
			<br>
			<div class="input-group">
				<h6 style="color: black; margin-right: 43px;">
					<strong>Total Amount to be paid:</strong>
				</h6>
				<h6 style="color: black; margin-left: 43px;">${ticketDetails.getFare()}
					* ${ticketDetails.getNo_of_passengers()} =
					${ticketDetails.getAmount()}</h6>
			</div>
			<br>
			<h6 style="color: black; margin-left: -470px;">
				<strong>Passenger's Details:</strong>
			</h6>
			<div class="input-group">
				<h6 style="color: black; margin-left: 170px;">
					<strong>Customer Id:</strong>
				</h6>
				<h6 style="color: black; margin-left: 100px;">${sessionScope.customer_id}</h6>
			</div>
			<div class="input-group">
				<h6 style="color: black; margin-left: 170px;">
					<strong>Customer Name:</strong>
				</h6>
				<h6 style="color: black; margin-left: 70px;">${sessionScope.fName}
					${sessionScope.lName}</h6>
			</div>
			<div class="input-group">
				<h6 style="color: black; margin-left: 170px;">
					<strong>Email Address:</strong>
				</h6>
				<h6 style="color: black; margin-left: 87px;">${sessionScope.email}</h6>
			</div>
			<div class="input-group">
				<h6 style="color: black; margin-left: 170px;">
					<strong>Phone Number:</strong>
				</h6>
				<h6 style="color: black; margin-left: 77px;">${sessionScope.pNumber}</h6>
			</div>
			<br>
			<h6 style="color: black; margin-left: -470px;">
				<strong>Payment Details:</strong>
			</h6>
			<div class="input-group">
				<h6 style="color: black; margin-left: 170px;">
					<strong>Card Number:</strong>
				</h6>
				<h6 style="color: black; margin-left: 90px;">${sessionScope.CNumber}</h6>
			</div>
			<div class="input-group">
				<h6 style="color: black; margin-left: 170px;">
					<strong>Card Holder Name:</strong>
				</h6>
				<h6 style="color: black; margin-left: 53px;">${sessionScope.CHName}</h6>
			</div>
			<div class="input-group">
				<h6 style="color: black; margin-left: 170px;">
					<strong>Payment Date:</strong>
				</h6>
				<h6 style="color: black; margin-left: 87px;">${ticketDetails.getDate()}</h6>
			</div>
			<br>
			<button type="button" class="btn btn-primary btn-lg btn-block"
				onclick="printDiv('printContent')">Print Ticket</button>
		</div>
		
	</div>
			
		</div>

	<br>
	
	
	<!-- Footer start -->
	<div class="footer">
		<div class="aa-footer-top bg-dark">
			<div class="row">
				<div class="col-3"></div>
				<!-- Empty column for spacing -->
				<div class="col-6 center-cols">
					<i class="fas fa-plane fa-3x"
						style="color: blue; display: flex; padding-top: 25px;"></i>
					<p>
						Here at FlyAway we provide flights at the cheapest rate to help
						you reach<br>your destination
					</p>
					<h5>
						<strong>Contact Info</strong>
					</h5>
					<span class="mr-2" style="color: blue;">&#9742;</span>
					<h6>{888}888-8888</h6>
					<span style="color: blue;">&#9993;</span>
					<h6>support@flyway.com</h6>
					<hr style="background-color: white;">
					<h6>&copy FlyAway, All Rights Reserved</h6>

				</div>
				<div class="col-3"></div>
				<!-- Empty column for spacing -->
			</div>
		</div>
	</div>
	<!-- Footer End -->
	
</body>
</html>