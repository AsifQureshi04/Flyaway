<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
	function redirectToPage(){
		window.location.href = "ConfirmBooking.jsp";
	}
	
	function fetchForm(){
		document.getElementById("fetchForm").submit();
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
				<li><form action="CustomerDetailsServlet" id="fetchForm" method="Post"><a href="#" onclick="submitForm()">CUSTOMER DETAILS</a></form></li>
				<li><a href="#">CHANGE PASSWORD</a></li>&nbsp;&nbsp;&nbsp;
				<li><i class="fas fa-sign-out-alt"></i></li>
				<li><a href="LogoutServlet">LOGOUT</a></li>
			</ul>
		</div>
	</nav>
	<!-- Navbar end -->
	
	<h1 style="font-size: 20px;color:green;">
		Welcome,
		<%=session.getAttribute("fName")%>
		<%=session.getAttribute("lName")%>!
	</h1>
	<br style="height: 1500px;">
	<div class=""container>
		<div class="row justify-content-center">
			<div class="col-12 col-md-8">
				<div class="card border-success mb-10" style="max-width: 50rem;">
					<h2  class="card-header bg-transparent border-success" style="text-align:center;color:green;">Booking
						Details</h2>
					<div class="input-group">
						<h6 style="text-align:left; color:black;">Flight Number:</h6>
						<h6 style="margin-left:143px; color:black;">${ticketDetails.flight_Number}</h6>
					</div><br>
					<div class="input-group">
						<h6 style="text-align:left; color:black;">Airline:</h6>
						<h6 style="margin-left:201px; color:black;">${ticketDetails.airline}</h6>
					</div><br>
					<div class="input-group">
						<h6 style="text-align:left; color:black;">Travel class:</h6>
						<h6 style="margin-left:168px; color:black;">${ticketDetails.flight_class}</h6>
					</div><br>
					<div class="input-group">
						<h6 style="text-align:left; color:black;">Source:</h6>
						<h6 style="margin-left:200px; color:black;">${ticketDetails.src}</h6>
					</div><br>
					<div class="input-group">
						<h6 style="text-align:left; color:black;">Destination:</h6>
						<h6 style="margin-left:166px; color:black;">${ticketDetails.dest}</h6>
					</div><br>
					<div class="input-group">
						<h6 style="text-align:left; color:black;">Travel Date:</h6>
						<h6 style="margin-left:168px; color:black;">${ticketDetails.date}</h6>
					</div><br>
					<div class="input-group">
						<h6 style="text-align:left; color:black;">Number of Passengers:</h6>
						<h6 style="margin-left:85px; color:black;">${ticketDetails.no_of_passengers}</h6>
					</div><br>
					<div class="input-group">
						<h6 style="text-align:left; color:black;">Amount to be Paid:</h6>
						<h6 style="margin-left:112px; color:black;">${ticketDetails.fare} * ${ticketDetails.no_of_passengers} = ${ticketDetails.amount}</h6>
					</div><br>
					<div class="input-group">
						<h6 style="text-align:left; color:black;">Passenger's Details:</h6>
							<h6 style="margin-left:110px; color:black;">Customer_Id:</h6>
							<h6 style="margin-left:150px; color:black;">${sessionScope.customer_id} </h6><br>		
							<h6 style="margin-left:250px; color:black;">Customer Name:</h6>
							<h6 style="margin-left:122px; color:black;">${sessionScope.fName} ${sessionScope.lName}</h6><br>
							<h6 style="margin-left:250px; color:black;">Email Id:</h6>
							<h6 style="margin-left:182px; color:black;">${sessionScope.email}</h6><br>
							<h6 style="margin-left:250px; color:black;">Phone Number:</h6>
							<h6 style="margin-left:130px; color:black;">${sessionScope.pNumber}</h6>									
					</div>
					<div class="card-footer bg-transparent border-success d-flex justify-content-center"><button type="button" class="btn btn-outline-success btn-sm d-grid gap-2" style="border-radius: 1rem;
    width: 403px;" onclick="redirectToPage()">Confirm Booking</button></div>
					
				</div>
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