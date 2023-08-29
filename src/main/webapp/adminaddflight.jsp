<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
				<li><a href="index.jsp">ADMIN DETAILS</a></li>
				<li><a href="#">CHANGE PASSWORD</a></li>
				<li><a href="#">LOGOUT</a></li>
			</ul>
		</div>
	</nav>
	<!-- Navbar end -->
	
	<br style="height:1500px;">
	

	<div class="col-md-8" style="margin: auto;">
		<br>
		<form action="AdminAddFlightServlet" method="Post" class="shadow-lg p-3 mb-5 bg-white rounded" style="border: none;">
			<h1 style="text-align: center;">Add New Flight</h1>
			<br>
			
			<div class="container" style="margin-top: -24px;">
					<!-- Display the alert if the session attribute is set -->
					<c:if test="${not empty sessionScope.alert}">
						<div class="alert alert-danger alert-dismissible fade show"
							role="alert" style="text-align: center;">
							${sessionScope.alert}
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<%-- Clear the session attribute --%>
						<%
						session.removeAttribute("alert");
						%>
					</c:if>
				</div>			
			
			<div class="row">
				<div class="col">
					<Label>Flight Number</Label>
					<div class="form-group">
						<input id="flightNo" class="form-control" name="flightNo" type="number" required>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<Label>Airline</Label>
					<div class="form-group">
						<select id="flight" class="form-control" name="flight" placeholder="Select" required>
							<option></option>
							<option>Indigo</option>
							<option>Akasa</option>
							<option>JetAirways</option>
							<option>Kingfisher</option>
							<option>SpiceJet</option>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<Label>Select Weekdays</Label>
					<div class="row form-group" required>
						&nbsp;&nbsp;&nbsp;<input type="checkbox" id="myCheckbox1" name="days" value="Sunday">
						<label for="myCheckbox">Sunday</label>&nbsp;&nbsp;
						<input type="checkbox" id="myCheckbox2" name="days" value="Monday">
						<label for="myCheckbox">Monday</label>&nbsp;&nbsp;
						<input type="checkbox" id="myCheckbox3" name="days" value="Tuesday">
					    <label for="myCheckbox">Tuesday</label>&nbsp;&nbsp;
						<input type="checkbox" id="myCheckbox4" name="days" value="Wednesday">
						<label for="myCheckbox">Wednesday</label>&nbsp;&nbsp;
						<input type="checkbox" id="myCheckbox5" name="days" value="Thursday">
						<label for="myCheckbox">Thursday</label>&nbsp;&nbsp;
						<input type="checkbox" id="myCheckbox6" name="days" value="Friday">
					    <label for="myCheckbox">Friday</label>&nbsp;&nbsp;
						<input type="checkbox" id="myCheckbox7" name="days" value="Saturday">
					    <label for="myCheckbox">Saturday</label>&nbsp;&nbsp;
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<Label>Source Airport</Label>
					<div class="form-group">
						<select id="from" class="form-control" name="from" required>
							<option></option>
							<option>NEW DELHI</option>
							<option>MUMBAI</option>
							<option>CHENNAI</option>
							<option>BANGLORE</option>
							<option>GOA</option>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<Label>Destination Airport</Label>
					<div class="form-group">
						<select id="to" class="form-control" name="to" required>
							<option></option>
							<option>NEW DELHI</option>
							<option>MUMBAI</option>
							<option>CHENNAI</option>
							<option>BANGLORE</option>
							<option>GOA</option>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="form-group">
						<button type="submit" class="btn btn-success btn-lg btn-block">Add Flight</button>
					</div>
				</div>
			</div>
		</form>
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

		<script>
		function validateFromTo() {
			var fromSelect = document.getElementById("from");
			var toSelect = document.getElementById("to");

			var fromValue = fromSelect.value;
			var toValue = toSelect.value;

			if (fromValue === toValue) {
				// Display an error message or perform other actions
				alert("Source and destination must be different");
				// You can also set the fields to their default values or handle the error accordingly
				fromSelect.value = "";
				toSelect.value = "";
			}
		}

		// Attach the event listener to the "input" event of "from" and "to" input elements
		var fromInput = document.getElementById("from");
		fromInput.addEventListener("input", validateFromTo);
		
		var toInput = document.getElementById("to");
		toInput.addEventListener("input", validateFromTo);
	</script>

	
</body>
</html>