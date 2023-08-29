<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
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
		window.location.href = "login.jsp";
	}
	
	document.addEventListener("DOMContentLoaded", function() {
	    
	    const pwd = document.getElementById("pass");
	    const chk = document.getElementById("chk");
	    
	    chk.addEventListener("change",function(){
	        if(this.checked){
	            pwd.type = "text";
	        }else{
	            pwd.type = "password";
	        }
	    });
		});
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
				<li><a href="index.jsp">HOME</a></li>
				<li><a style="pointer-events: none;cursor: not-allowed;opacity: 0.5;">ADMIN LOGIN</a></li>
				<li><a href="login.jsp">CUSTOMER LOGIN</a></li>
			</ul>
		</div>
	</nav>
	<!-- Navbar end -->
	
	<br style="height:1500px;">
	
	<div class="col-md-4" style="margin:auto;">
		<form action="AdminLoginServlet" method="Post" class="shadow-lg p-3 mb-5 bg-white rounded" style="border:none;">
			<h1 style="text-align:center;">Admin LogIn Form</h1><br>
			<div class="row">
				<div class="col">
					<Label>Email Address</Label>
					<div class="form-group">
						<input id = "emailId" name="email"  type="email" placeholder="Enter Email Id" class="form-control">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
				<Label>Password</Label>
					<div class="form-group">
						<input id = "pass" name="pass" type="password" placeholder="Enter Password"  class="form-control">
						<span
								style="color: red; text-align: left"> <c:if
									test="${not empty errorMessage}">
                				${errorMessage}
            					</c:if>
							</span><br> <input type="checkbox" id="chk">Show Password<br/>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="form-group">
						<button type="submit" class="btn btn-success btn-lg btn-block">LogIn</button>
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
	
</body>
</html>