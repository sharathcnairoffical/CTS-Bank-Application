<%@page import="java.net.http.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

	<head>
	<!-- Required meta tags -->
		<meta charset="ISO-8859-1">
		<meta name="viewport"
			content="width=device-width, initial-scale=1, shrink-to-fit=no">
			<link rel="stylesheet" href="/style/table.css">
			
			
			
		<!-- Bootstrap CSS -->
		<link rel="stylesheet"
			href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
			integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
			crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
			integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
			crossorigin="anonymous"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
			integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
			crossorigin="anonymous"></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
			integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
			crossorigin="anonymous"></script>
		<link rel="stylesheet" href="style.css">
		<link rel="stylesheet"
			href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
		<style>
			
			input::-webkit-outer-spin-button,
			input::-webkit-inner-spin-button {
			-webkit-appearance: none;
			margin: 0;
			}

			/* Firefox */
			input[type=number] {
			-moz-appearance: textfield;
			}

			body {
			margin: 0;
			padding: 0;
			font-family: sans-serif;
			color:white;
			 background-image: url('css/images/bg.jpg') ;
			 
			 
			 background-repeat: no-repeat;
  			
			  background-attachment: fixed;
  			 background-size: cover;
			
			}
			ul {
			list-style-type: none;
			margin: 0;
			padding: 0;
			overflow: hidden;
			background-color: #333;
			}

			li {
			float: left;
			}

			li a {
			display: block;
			color: white;
			text-align: center;
			padding: 14px 16px;
			text-decoration: none;
			}

			li a:hover:not(.active) {
			background-color: #111;
			}

			.active {
			background-color: #4c56af;
			}
			.center{
				margin-left: auto;
				margin-right: auto;
			}
		</style>
</head>
<body>
		<%
		response.setHeader("cache-control", "no-cache , no-store , must-revalidate");
		response.setHeader("pragma", "no-cache");
		response.setDateHeader("Expires", 0);

		if (session.getAttribute("token") == null) {
	%>
	<c:redirect url="/403" />
	<%
		}
	%>
	
	
	<ul id="navpart" >
		
		<li><img src="css/images/logo.png" alt="logo" style=" width:200px; height:70px; padding-top:10px;padding-bottom:5px;padding-left:10px;"></li>
		
		<li style="float:right"><a class="active" style="background-color:#333" href="/LOGOUT">Logout</a></li>
		<li style="float:right"><a class="active" style="background-color:#333" href="http://localhost:8080/dashboard">HOME</a></li>
	</ul>
	<br>
	
	
	<div align="center">
				<caption style="font-family: Bradley Hand ITC;">
					<br><h1 style="color:#ff652f;">CTS Bank</h1>
				</caption>
			</div>
	<div style="margin: 2em 120em 14em 12em;">
				<div class="card   " style="width: 900px; background: rgb(0, 0, 0); /* Fallback color */
  					background: rgba(0, 0, 0, 0.8); /* Black background with 0.5 opacity */
  					color: #f1f1f1;">
					<div class="card-body">
						<div align="center">
				<caption style="font-family: Bradley Hand ITC;">
					<h3>Customer Details</h3>
				</caption>
			</div>
					<br><br>
					<div align="center">
						<caption>
							<h5>Personal Details</h5>
							<br>
						</caption>
					
					
					<table class="center" border="2" cellpadding="7" style="width: 900;">
						<tr >
							<th>CUSTOMER ID</th>
							<th>CUSTOMER NAME</th>
							<th>DOB</th>
							<th>PAN</th>
							<th>ADDRESS</th>
							
						</tr>
						<tr>
							<td><c:out value="${customer.userid}" /></td>
							<td><c:out value="${customer.username}" /></td>
							<td><c:out value="${customer.dateOfBirth}" /></td>
							<td><c:out value="${customer.pan}" /></td>
							<td><c:out value="${customer.address}" /></td>
						</tr>
					</table>
					<br>
				
					<caption>
						<div align="center">
						<br><br><br>
						<h5 style="color: white;">Account Details</h5></div>
					</caption>
					<table border="2" cellpadding="5" style="width: 900;">
						<tr>
							<th>ACCOUNT ID</th>
							<th>CURRENT BALANCE</th>
							<th>ACCOUNT TYPE</th>
							<th>OWNER NAME</th>
						</tr>
						<c:forEach var="acc" items="${customer.accounts}">
						<tr>
								
									<td><c:out value="${acc.accountId}" /></td>
									<td><c:out value="${acc.currentBalance}" /></td>
									<td><c:out value="${acc.accountType}" /></td>
									<td><c:out value="${acc.ownerName}" /></td>
						</tr>
						</c:forEach>
						
					</table>
				
				</div>
			<br><br>
				<div align="center">
					<br><a href="/dashboard">Back</a>

		</div>
	</div>
		</div>
	</div>
	
	
	
	 <div class="container my-5">
 		
 													 <!-- Footer -->
 	 <footer class="text-center text-white" style="background-color:rgba(0, 0, 0, 0.5)">
    
		<div class="container" >
			     
			 <section class="mt-10" >
			        
		    	   <div class="row text-center d-flex justify-content-center pt-5">
		        
		        	  <div class="col-md-2">
		           		 <h6 class="text-uppercase font-weight-bold">    <a href="https://www.calculator.net/loan-calculator.html" class="text-white" id="sa">Loan Calculator</a>	 </h6>
		         	 </div>
		        
		          	<div class="col-md-2">
		           		 <h6 class="text-uppercase font-weight-bold">     <a href="https://tax2win.in/guide/link-pan-card-with-bank-account" class="text-white" id="sa">Link Pan Card </a>	</h6>
		          	</div>
		          
		          	<div class="col-md-2">
		           		 <h6 class="text-uppercase font-weight-bold">	<a   href="https://www.gst.gov.in/">GSTN</a>	</h6>
		          	</div>
		          
		          	<div class="col-md-2" >
		            	<h6 class="text-uppercase font-weight-bold" >	 <a href="https://www.chime.com/blog/9-tips-for-safer-online-banking/" class="text-white" id="sa">Security</a>	</h6>
		          	</div>
		          
		          
		          	<div class="col-md-2">
		            	<h6 class="text-uppercase font-weight-bold">	<a id="sa" href="https://theholidayschedule.com/bank-holidays.php#:~:text=2020%20Bank%20Holidays%201%20New%20Year%27s%20Day%202,9%20Veterans%20Day%2010%20Thanksgiving%20More%20items...%20" class="text-white">Bank Holidays</a>	</h6>
		          	</div>
		          
		     	  </div>
		       
		 	</section>
      										<!-- Section: Links -->

     		 <hr class="my-5" />

     										 <!-- Section: Text -->
      		<section class="mb-10">
			        <div class="row d-flex justify-content-center">
			         	 <div class="col-lg-8">
				            	<p>  Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt
				              distinctio earum repellat quaerat voluptatibus placeat nam,
				              commodi optio pariatur est quia magnam eum harum corrupti
				              dicta, aliquam sequi voluptate quas. </p>
			          	</div>
			        </div>
   			</section>
     

     		 <!-- Section: Social -->
      		<section class="text-center mb-5">
		        	<a href="https://www.facebook.com/" class="text-white me-4">	<i class="fa fa-facebook fa-lg white-text mr-md-5 mr-3 fa-2x"></i>   	</a>
		        	<a href="https://twitter.com/" class="text-white me-4">								<i class="fa fa-twitter fa-lg white-text mr-md-5 mr-3 fa-2x"></i>		</a>
		       	    <a href="https://www.google.co.in/" class="text-white me-4">								<i class="fa fa-google-plus fa-lg white-text mr-md-5 mr-3 fa-2x"></i>   </a>
		        	<a href="https://www.instagram.com/" class="text-white me-4">								<i class="fa fa-instagram fa-lg white-text mr-md-5 mr-3 fa-2x"></i>		</a>
		        	<a href="https://in.linkedin.com/" class="text-white me-4">								<i class="fa fa-linkedin fa-lg white-text mr-md-5 mr-3 fa-2x"></i>		</a>
		        	<a href="https://github.com/" class="text-white me-4">								<i class="fa fa-github fa-lg white-text mr-md-5 mr-3 fa-2x"></i>		</a>
      		</section>
      									<!-- Section: Social -->
  
    
    	<div class="text-center p-3"	style="background-color: rgba(0, 0, 0, 0.7)">  © 2022 Copyright:
      		<a class="text-white" href="#">ctsbank.com</a>
    	</div>
    
   </div>  
  </footer>
 
</div>s
	
	
	
</body>
</html>