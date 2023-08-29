<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<!DOCTYPE html>
<html>
<head>
<title>Fly Away | FLIGHT DETAILS</title>
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
	
	<br style="height:1500px;">
	
	<table class="table col-md-6" style="margin:auto; border:dark-black; font-size:15px;">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Flight No</th>
      <th scope="col">Airline</th>
      <th scope="col">Travel Date</th>
      <th scope="col">Source</th>
      <th scope="col">Destination</th>
      <th scope="col"> </th>
    </tr>
  </thead>
  <tbody>
     
    <c:forEach var="flightDetails" items="${flightDetailsList}">
     <tr>
         <td id="flightNo">${flightDetails.getFlightNo()}</td>
         <td>${flightDetails.getAirline()}</td>
         <td>${flightDetails.getTraveldate()}</td>
         <td>${flightDetails.getFrom()}</td>
         <td>${flightDetails.getTo()}</td>
         <td>
         	<form method="post" action="ShowFareDetailsServlet">
                <input type="hidden" name="flightNo" value="${flightDetails.getFlightNo()}">
                <input type="hidden" name="airline" value="${flightDetails.getAirline()}">                
                <button type="submit" class="btn btn-primary" style="width: 115px;">Book Tickets</button>
            </form>
         </td>
         <!-- Add more cells as per your ResultSet -->
     </tr>
	</c:forEach>    
  </tbody>
</table>

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
    function sendRowData(button) {
        var row = button.parentNode.parentNode; // Get the parent row of the clicked button
        var rowData = {
                col1: row.cells[0].innerText,
                col2: row.cells[1].innerText,
                // Add more properties for other columns
            };


        // Convert the rowData object to a query string
        // var queryString = Object.keys(rowData).map(key => key + "=" + encodeURIComponent(rowData[key])).join("&");

        // Send the data to the destination page using window.location.href
        // window.location.href = "showfaredetails.jsp?" + queryString;
      
        
        var form = document.createElement("form");
        form.method = "Post";
        form.action = "ShowFareDetailsServlet";
        for (var key in rowData) {
            var input = document.createElement("input");
            input.type = "hidden";
            input.name = key;
            input.value = rowData[key];
            form.appendChild(input);
        }

        
        document.body.appendChild(form);
        form.submit();
    }
</script>

	
</body>
</html>