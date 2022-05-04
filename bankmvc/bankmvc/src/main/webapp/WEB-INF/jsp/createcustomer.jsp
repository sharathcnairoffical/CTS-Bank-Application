<%@page import="java.net.http.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">



	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
    
    
    <link rel="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js">
    <link rel="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    
    
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



<link href="css/register.css" rel="stylesheet">
<title>Create Customer</title>
<style>
#message
{
	color : red; 
}
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}
 /*   ------------------------------------------------------------------------------ */


.overlay {
position: fixed;
top: 0;
bottom: 0;
left: 0;
right: 0;
background: rgba(0, 0, 0, 0.7);
transition: opacity 500ms;
visibility: hidden;
opacity: 0;
}



.popup {
margin: 70px auto;
padding: 20px;
background: #fff;
border-radius: 5px;
width: 30%;
position: relative;
transition: all 5s ease-in-out;
}



.popup h2 {
margin-top: 0;
color: #333;
font-family: Tahoma, Arial, sans-serif;
}



.popup .close {
position: absolute;
top: 20px;
right: 30px;
transition: all 200ms;
font-size: 30px;
font-weight: bold;
text-decoration: none;
color: #333;
}



.popup .close:hover {
color: #06D85F;
}



.popup .content {
max-height: 30%;
overflow: auto;
}



@media screen and (max-width: 700px){
.box{
width: 70%;
}
.popup{
width: 70%;
}
}

/*----------------------------------------------------------------------------------*/

/* Firefox */
input[type=number] {
  -moz-appearance: textfield;
}
body {
			margin: 0;
			font-family: sans-serif;
			color:white;
			/*background: linear-gradient(to right, #610354, #053070);*/
			background-image: url('css/images/bg.jpg');
			
			background-repeat: no-repeat;
  			
			  background-attachment: fixed;
  			 background-size: cover;
			
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
			
	ul {
			list-style-type: none;
			margin: 0;
			padding-left:30;
			overflow: hidden;
			background-color: #333;
			}

			li {
			float: left;
			}		
	
	#navpart{
			padding-top: 10px;
			padding-bottom:10px;
			background-color:#333;
			text-align:center;
			}
			
			.active {
			color:#ff652f;
			text-align:center
			}
</style>




 <script type="text/javascript">
            function inputf1() {
                var p1 = document.getElementById("input1").value;
                if (p1=="") {
                     document.getElementById("input1p").innerHTML = "Please Enter User Name";
                } 
                else{
                 document.getElementById("input1p").innerHTML = "";
                 }
            }
            
            
            function inputf2() {
                var p2 = document.getElementById("input2").value;
                if (p2=="") {
                     document.getElementById("input2p").innerHTML = "Please Enter Password";
                }
                else{
                 document.getElementById("input2p").innerHTML = "";
                 } 
            }
            
            function inputf3() {
                var p3 = document.getElementById("date").value;
                if (p3=="") {
                     document.getElementById("input3p").innerHTML = "Please Enter Date Of Birth";
                } 
                else{
                 document.getElementById("input3p").innerHTML = "";
                 }
            }
            
            function inputf4() {
                var p4 = document.getElementById("input4").value;
                if (p4=="") {
                     document.getElementById("input4p").innerHTML = "Please Enter Pan Number";
                } 
               /* else if (p4!= /[A-Z]{5}[0-9]{4}[A-Z]{1}$/){
                document.getElementById("input4p").innerHTML = "Please Enter Valid Number";
                }*/
                else{
                 document.getElementById("input4p").innerHTML = "";
                 }
            }
 </script>





</head>
<body>

<ul id="navpart">
		
		<li><img src="css/images/logo.png" alt="logo" style=" width:200px; height:70px; padding-top:10px;padding-bottom:5px;padding-left:10px;"></li>
		
		<li style="float:right"><a class="active"  href="/logout">Logout</a></li>
		<li style="float:right"><a class="active"  href="http://localhost:8080/dashboard">Home</a></li>
	</ul>
	<br>

<div align="center">
		
		
	<%if (session.getAttribute("token") == null) {%>
	<c:redirect url="/403" />
	<%}%>
<br><br>
         <h1 style="font-weight: bold; color:#ff652f;">CTS Bank</h1>
	<div id="login-box">
    <div class="card  " style="width: 480px;height:auto; background: rgb(0, 0, 0); /* Fallback color */
  					background: rgba(0, 0, 0, 0.8); /* Black background with 0.5 opacity */
  					color: #f1f1f1;">
  				<br/>	
    <h2 class="signup" style="color:white;">Customer Sign up</h2>
    <br><br>
    <form:form action="/finishedCustomerCreation" method="post" modelAttribute="customer">
    
	    <!--label for="userid">Enter Customer Id:</label><span class="required" style="color: red;"-->
	    <!--form:input type="text" class="form-control form-rounded" path="userid" name="Id" placeholder="Enter Id" autocomplete="off" required="required"/-->
	    
	   
		<label for="username">Enter Username:</label><span class="required" style="color: red;"> *</span><br>
	    <form:input type="text" id="input1" class="form-control form-rounded" path="username" name="username" placeholder="Enter Username" autocomplete="off" required="required"/>
	    
	    <p id="input1p" style="color:red"></p>
	    
		<label for="password">Enter Password:</label><span class="required" style="color: red;"> *</span><br>
		<form:input type="password" id="input2" onclick="inputf1()" class="form-control form-rounded" path="password" name="password" placeholder="Enter Password" required="required"/>
	    
	    
	    <p id="input2p" style="color:red"></p>
	    
		<label for="dateOfBirth">Enter Date Of Birth:</label><span class="required" style="color: red;"> *</span><br>
		<form:input type="date"  onclick="inputf2()"  class="form-control form-rounded" id="date" path="dateOfBirth" name="dob" placeholder="Date of Birth"/>

		
		<p id="input3p" style="color:red"></p>
		
		<label for="pan">Enter Pan Number: </label><span class="required" style="color: red;">*</span><br>
		<form:input type="text" id="input4" onclick="inputf3()" class="form-control form-rounded" path="pan" name="pan" placeholder="Pan Number" autocomplete="off" required="required"/>

		
		<p id="input4p" style="color:red"></p>
		
		
		<label for="address">Enter Address</label><span class="required" style="color: red;"> *</span><br>
		<form:input type="text"  onclick="inputf4()" class="form-control form-rounded" path="address" name="address" placeholder="Address" autocomplete="off" required="required"/>
		 		
		
		 		 
	    <div class="box">
	    <input type="submit" href="#popup1" name="signup_submit" value="Create" style="background-color:#ff652f;" />
     	 </div>    
		<!--div id="popup1" class="overlay">
			<div class="popup">
			<h2>Here i am</h2>
			<a class="close" href="#">&times;</a>
			<div class="content">
			Thank to pop me out of that button, but now i'm done so you can close this window.
			</div>
			</div>
			</div-->
  			
  		  
    </form:form>
    <p id="message">${msg1} </p>
	<p id="message">${msg} </p>
	
    </div>
    </div>   

</div>


<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
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

</div>


</body>
</html>