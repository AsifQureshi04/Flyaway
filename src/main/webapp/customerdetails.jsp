<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
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

 table {
     border-collapse: collapse;
     width: 100%;
 }
 th, td {
     border: 1px solid black;
     padding: 8px;
     text-align: left;
 }
 th {
     background-color: #f2f2f2;
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
	
	function redirectToChangePassword(){
		window.location.href = "forgot-password.jsp";
	}
	
	function redirectToBookFlight(){
		window.location.href = "bookflight.jsp";
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
				<li><a href="#">CUSTOMER DETAILS</a></li>
				<li><a href="#">CHANGE PASSWORD</a></li>
				<li><i class="fas fa-sign-out-alt"></i></li>
				<li><a href="#" onclick="logout()">LOGOUT</a></li>
			</ul>
		</div>
	</nav>
	<!-- Navbar end -->
	
	<br style="height: 1500px;">

  <div class="container" style="margin-top:-24px;">
        <!-- Display the alert if the session attribute is set -->
        <c:if test="${not empty sessionScope.alert}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert" style="text-align:center;">
                ${sessionScope.alert}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%-- Clear the session attribute --%>
            <%
                session.removeAttribute("alert");
            %>
        </c:if>
  </div>
	
	
	
	<button type="button" class="btn btn-primary"
		OnClick="redirectToBookFlight()">Book a new journey</button>
	<button type="button" class="btn btn-primary"
		OnClick="redirectToChangePassword()">Change Password</button>
	<div class="col-md-8" style="margin: auto;">

		<h4 style="text-align: center; color: blue;">ALL BOOKING DETAILS</h4>
		<br>
		<c:choose>
			<c:when test="${not empty details }">
				<table class="table table-bordered table-striped">
					<thead class="table-dark">
						<tr>
							<td>Booking Id&nbsp;&nbsp;&nbsp;</td>
							<td>Flight Number&nbsp;&nbsp;&nbsp;</td>
							<td>Airline&nbsp;&nbsp;&nbsp;</td>
							<td>Travel Class&nbsp;&nbsp;&nbsp;</td>
							<td>Travel Date&nbsp;&nbsp;&nbsp;</td>
							<td>Source&nbsp;&nbsp;&nbsp;</td>
							<td>Destination&nbsp;&nbsp;&nbsp;</td>
							<td>No of passengers&nbsp;&nbsp;&nbsp;</td>
							<td>Total Fare&nbsp;&nbsp;&nbsp;</td>
							<td>Customer Id&nbsp;&nbsp;&nbsp;</td>
							<td>Booking Status</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="row" items="${details}">
							<tr>
								<td>${row.getBooking_id()}</td>
								<td>${row.getFlight_Number()}</td>
								<td>${row.getAirline()}</td>
								<td>${row.getFlight_class()}</td>
								<td>${row.getDate()}</td>
								<td>${row.getSrc()}</td>
								<td>${row.getDest()}</td>
								<td>${row.getNo_of_passengers()}</td>
								<td>${row.getAmount()}</td>
								<td>${row.getCustomer_id()}</td>
								<td>${row.getStatus()}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="11" style="text-align:center; color:red;">No data available.</td>
				</tr>
			</c:otherwise>
		</c:choose>

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