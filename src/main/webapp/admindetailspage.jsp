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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>

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
	function redirectToPage() {
		window.location.href = "adminaddflight.jsp";
	}
	
	function changePassword() {
		window.location.href = "adminforgotpassword.jsp";
	}
	
	function addFare() {
		window.location.href = "addfaredetails.jsp";
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
				<li><a href="#">ADMIN DETAILS</a></li>
				<li><a href="#" onclick="changePassword()">CHANGE PASSWORD</a></li>
				<li><a href="#" onclick="logout()">LOGOUT</a></li>
			</ul>
		</div>
	</nav>
	<!-- Navbar end -->
	<br />
	<div class="container" style="margin-top: -24px;">
		<!-- Display the alert if the session attribute is set -->
		<c:if test="${not empty sessionScope.alert}">
			<div class="alert alert-danger alert-dismissible fade show"
				role="alert" style="text-align: center; color: #0f893b;
    background-color: #d9f8d7;
    border-color: #d9f8d7;">
				${sessionScope.alert}
				<i class="fa-solid fa-circle-check"></i>
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

	<br style="height: 1500px;">
	<div class="row">
		<button type="button" class="btn btn-primary btn-sm"
			style="width: 150px;" OnClick="redirectToPage()">Add a new
			Flight</button>
		&nbsp;&nbsp;
		<button type="button" class="btn btn-primary btn-sm"
			style="width: 150px;" onclick="changePassword()">Change Password</button>
	</div>

	<div class="col-md-8" style="margin: auto;">
		<h1 style="text-align: center; color: blue;">ALL FLIGHT DETAILS</h1>
		<br>
		<div class="shadow-lg p-3 mb-5 bg-white rounded" style="border: none;">
			<table class="table table-bordered table-striped">
				<thead class="thead-dark">
					<tr>
						<th scope="col">Flight Number<br />
						</th>
						<th scope="col">Airline</th>
						<th scope="col"><center>Week Days</center></th>
						<th scope="col">Source</th>
						<th scope="col">Destination</th>
						<th scope="col"><center>Classes</center></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="flight" items="${sessionScope.list }">
						<tr>
							<td>${flight.getFlightNo()}</td>
							<td>${flight.getAirline()}</td>
							<td>${flight.getTraveldate()}</td>
							<td>${flight.getFrom()}</td>
							<td>${flight.getTo()}</td>
							<td>
								<div style="display: flex; justify-content: spce-between;">
									<div style="width: 30%">
										<c:choose>
											<c:when test="${flight.getEconomy_fare() == 0 }">
												<form action="addfaredetails.jsp" method="post">
													<input type="hidden" name="flightNo"
														value="${flight.getFlightNo()}"> <input
														type="hidden" name="fareType" value="Economy">
													<button type="submit" class="btn btn-primary btn-sm"
														style="width: max-content; margin-right: 15px;"
														onclick="addFare()">Add Fare</button>
												</form>
											</c:when>
											<c:otherwise>
												<p style="color: black;">Economy&nbsp;&nbsp;&nbsp;</p>
					                        	${flight.getEconomy_fare()}				
											</c:otherwise>
										</c:choose>
									</div>
									<div style="width: 30%">
										<c:choose>
											<c:when test="${flight.getPremium_fare() == 0 }">
												<form action="addfaredetails.jsp" method="post">
													<input type="hidden" name="flightNo"
														value="${flight.getFlightNo()}"> <input
														type="hidden" name="fareType" value="Premium">
													<button type="submit" class="btn btn-primary btn-sm"
														style="width: max-content; margin-right: 15px;"
														onclick="addFare()">Add Fare</button>
												</form>
											</c:when>
											<c:otherwise>
												<p style="color: black;">Premium&nbsp;&nbsp;&nbsp;</p>
					                        	${flight.getPremium_fare()}				
											</c:otherwise>
										</c:choose>
									</div>
									<div style="width: 30%">
										<c:choose>
											<c:when test="${flight.getBusiness_fare() == 0 }">
												<form action="addfaredetails.jsp" method="post">
													<input type="hidden" name="flightNo"
														value="${flight.getFlightNo()}"> <input
														type="hidden" name="fareType" value="Business">
													<button type="submit" class="btn btn-primary btn-sm"
														style="width: max-content; margin-right: 15px;"
														onclick="addFare()">Add Fare</button>
												</form>
											</c:when>
											<c:otherwise>
												<p style="color: black;">Business&nbsp;&nbsp;&nbsp;</p>
					                        ${flight.getBusiness_fare()}				
										</c:otherwise>
										</c:choose>
									</div>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<br>

	<!-- 	<div class="modal fade" id="kycModal" tabindex="-1" role="dialog" aria-labelledby="kycModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="kycModalLabel">Complete KYC</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Form for completing KYC
                <form action="UploadFileServlet" method="post" enctype="multipart/form-data" id="kycForm">
                		<select id="type" class="form-control" name="type" required>
							<option> </option>
							<option>Aadhar</option>
							<option>PanCard</option>
							<option>VoterId</option>
							<option>DrivingLicense</option>
						</select>
                	 <br/>
                	  <input type="file" name="file" accept=".pdf, .doc, .docx, .jpg, .jpeg">
                	                
                    Add your form fields here
                </form>
                    <span style="font-size:14px;">.pdf, .doc, .docx, .jpg, .jpeg</span>
                
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" form="kycForm" class="btn btn-primary">Submit</button>
            </div>
        </div>
    </div>
</div> -->

	<!-- <script>
    // Show the Bootstrap modal when the "Complete Now" link is clicked
  $(document).ready(function() {
    // Show the Bootstrap modal when the "Complete Now" link is clicked
    $("#completeNowLink").click(function() {
        $("#kycModal").modal("show");
    });
});
</script>
 -->


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