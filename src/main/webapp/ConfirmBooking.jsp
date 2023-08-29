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
	function redirectToPage(){
		window.location.href = "ConfirmPayment.jsp";
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
				<li><a href="customerdetails.jsp">CUSTOMER DETAILS</a></li>
				<li><a href="#">CHANGE PASSWORD</a></li>
				<li><i class="fas fa-sign-out-alt"></i></li>				
				<li><a href="#" onclick="logout()">LOGOUT</a></li>
			</ul>
		</div>
	</nav>
	<!-- Navbar end -->
	
	<br style="height:1500px;">
	
	<div class="col-md-4" style="margin:auto;">
		<div class="shadow-lg p-3 mb-5 bg-white rounded" style="border:none;">
			<h1 style="text-align:center;">Payment Form</h1><br>
			<form action="ConfirmPaymentServlet" method="Post">
			<div class="row">
				<div class="col">
					<Label>Card Holder Name</Label>
					<div class="form-group">
						<input id = "CHName" name="CHName" type="text" placeholder="Enter Card Holder Name" class="form-control">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<Label>Card Number</Label>
					<div class="form-group">
						<input id="CNumber" name="CNumber" type="text" placeholder="Enter Card Number" class="form-control">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<Label>Total Amount to be Paid</Label>
					<div class="form-group">
						<input id="amount"  class="form-control" value="${ticketDetails.getAmount()}" readonly>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-lg btn-block" OnClick="redirectToPage()">Confirm Payment</button>						
					</div>
				</div>
			</div>
			</form>
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