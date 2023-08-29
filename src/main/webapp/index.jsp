<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FlyAway</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="navstyle.css">
<link rel="stylesheet" href="bdystyle.css">
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
		window.location.href="bookflight.jsp";
	}
</script>
</head>
<body>

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
				<li><a href="index.jsp">HOME</a></li>
				<li><a href="bookflight.jsp">BOOK FLIGHT</a></li>
				<li><a href="adminlogin.jsp">ADMIN LOGIN</a></li>
				<li><a href="login.jsp">CUSTOMER LOGIN</a></li>
			</ul>
		</div>
	</nav>

	<div class="content">
		<div class="container mt-lg-5 mb-5">
			<div class="content" style="position: relative;">
				<img src="images/pic3.jpg" alt="image fails to load"
					style="margin-top: -48px; margin-left: -120px; height: 400px; margin-bottom: -111px; width: 1350px;" />
				<h2 class="text-center"
					style="position: absolute; margin-top: -143px; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 1;">
					<strong>W E L C O M E &nbsp;&nbsp;T O &nbsp;&nbsp; F L Y A
						W A Y</strong>
				</h2>
				<br>
				<p class="text-center"
					style="position: absolute; margin-top: -100px; top: 60%; left: 50%; transform: translate(-50%, -50%); z-index: 1; color: black; font-size: 30px;">
					Y o u r&nbsp; j o u r n e y&nbsp; i s&nbsp; o n e&nbsp; c l i c k
					&nbsp;<br>a w a y
				</p>
				<button type="button" class="btn btn-outline-primary"
					style="margin-left: 450px;" OnClick="redirectToPage()">CLICK TO BOOK FLIGHT</button>
			</div>
		</div>
	</div>

	<hr
		style="height: 2px; background-color: black; border: none; margin: 10px 0;">

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



</body>
</html>
