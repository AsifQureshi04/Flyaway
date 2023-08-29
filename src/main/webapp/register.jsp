<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Fly Away | Registration</title>
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
				<li><a href="#">ADMIN LOGIN</a></li>
				<li><a href="#">CUSTOMER LOGIN</a></li>
			</ul>
		</div>
	</nav>
	<!-- Navbar end -->

	<br style="height: 1500px;">

	<div class="col-md-6" style="margin: auto;">
	  <form action="RegisterServlet" method="POST">	
		<div class="shadow-lg p-3 mb-5 bg-white rounded" style="border: none;">
			<h1 style="text-align: center;">Registration Form</h1>
			<br>
			<div class="row">
				<div class="col-md-6">
					<Label>First Name</Label>
					<div class="form-group">
						<input name="fName" id="fName" placeholder="Enter First Name"
							class="form-control" required>
					</div>
				</div>
				<div class="col-md-6">
					<Label>Last Name</Label>
					<div class="form-group">
						<input name="lName" id="lName" placeholder="Enter Last Name"
							class="form-control" required>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<Label>Email Address</Label>
					<div class="form-group">
						<input name="email" type="email" placeholder="Enter Email ID"
							class="form-control" id="email" required>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<Label>Password</Label>
					<div class="form-group">
						<input  name="password" type="password" placeholder="Enter Password" id="password"
							class="form-control" required>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<Label>Confirm Password</Label>
					<div class="form-group">
						<input name="confirmPassword" type="password" id="confirmPassword"
							placeholder="Confirm Password" class="form-control" required>
						<p id="passwordMismatchError" style="color: red; display: none; text-align:left">Passwords do not match.</p>						
							
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<Label>Phone Number</Label>
					<div class="form-group">
						<input name="phone" id="phone" placeholder="Enter Phone Number"
							class="form-control" id="pNumber" required>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="form-group">
						<button type="submit" class="btn btn-success btn-lg btn-block"
							>Register</button>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="form-group">
						<button type="button" class="btn btn-success btn-lg btn-block"
							OnClick="redirectToPage()">Log Into Existing Account</button>
					</div>
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
        var passwordInput = document.getElementById('password');
        var confirmPasswordInput = document.getElementById('confirmPassword');
        var passwordMismatchError = document.getElementById('passwordMismatchError');

        function checkPasswordMatch() {
            if (passwordInput.value !== confirmPasswordInput.value) {
                confirmPasswordInput.setCustomValidity('Passwords do not match.');
                passwordMismatchError.style.display = 'block';
            } else {
                confirmPasswordInput.setCustomValidity('');
                passwordMismatchError.style.display = 'none';
            }
        }

        // Add event listeners to check password match on keyup and change events

        passwordInput.addEventListener('keyup', checkPasswordMatch);
        confirmPasswordInput.addEventListener('keyup', checkPasswordMatch);
</script>
<!-- Add this at the top of the page to display the error message -->
<% String errorMessage = (String) request.getAttribute("errorMessage"); %>
<% if (errorMessage != null) { %>
    <script>
        alert('<%= errorMessage %>');
    </script>
<% } %>


</body>
</html>