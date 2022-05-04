<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>



	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
    
    
    <link rel="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js">
    <link rel="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    
    
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<meta charset="ISO-8859-1">
<link href="register.css" rel="stylesheet">
<title>Create Account</title>
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
    input[type="text"],
input[type="number"],
select[type="text"]
{
  display: block;
  box-sizing: border-box;
  margin-bottom: 20px;
  padding: 4px;
  width: 220px;
  height: 32px;
  border: none;
  border-bottom: 1px solid #AAA;
  font-family: 'Roboto', sans-serif;
  font-weight: 400;
  font-size: 15px;
  transition: 0.2s ease;
}

input[type="text"]:focus,
input[type="number"]:focus {
  border-bottom: 2px solid #16a085;
  color: #16a085;
  transition: 0.2s ease;
}

input[type="submit"] {
  margin-top: 28px;
  width: 120px;
  height: 32px;
  background: #16a085;
  border: none;
  border-radius: 2px;
  color: #FFF;
  font-family: 'Roboto', sans-serif;
  font-weight: 500;
  text-transform: uppercase;
  transition: 0.1s ease;
  cursor: pointer;
}

input[type="submit"]:hover,
input[type="submit"]:focus {
  opacity: 0.8;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
  transition: 0.1s ease;
}

input[type="submit"]:active {
  opacity: 1;
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.4);
  transition: 0.1s ease;
}
body {
			margin: 0;
			font-family: sans-serif;
			 color: #ff652f;
			/*background: linear-gradient(to right, #610354, #053070);*/
			background-image: url('css/images/bg.jpg');
			
			
			background-repeat: no-repeat;
  			
			  background-attachment: fixed;
  			 background-size: cover;
			
	}
a{
color:cyan;
}



footer{
            /*background: rgb(0, 91, 143);*/
          
           width:auto;
           margin:auto;
           
           height:10%;
            
        }
        a:link{
            color: #fff;
            text-decoration: none;
        }
        a:visited{
            color: #fff;
            text-decoration: none;
        }
        a:hover{
            color: #fff;
            text-decoration: none;
        }
        a:active{
            color: #fff;
            text-decoration: none;
        }
        

.srch{
    font-family: 'Times New Roman';
    width: 200px;
    height: 40px;
    background: transparent;
    border: 1px solid #ff7200;
    margin-top: 13px;
    color: #fff;
    border-right: none;
    font-size: 16px;
    float: left;
    padding: 10px;
    border-bottom-left-radius: 5px;
    border-top-left-radius: 5px;
}

.navbar{
    width: 1200px;
    height: 75px;
    margin: auto;
    background-color:#333;
}

.icon{
    width: 200px;
    float: left;
    height: 70px;
}

.logo{
    color: #ff7200;
    font-size: 35px;
    font-family: Arial;
    padding-left: 20px;
    float: left;
    padding-top: 10px;
    margin-top: 5px
}

.menu{
    width: 400px;
    float: left;
    height: 70px;
}

.menu ul{
    float: left;
    display: flex;
    justify-content: center;
    align-items: center;
}

.menu ul li{
    list-style: none;
    margin-left: 62px;
    margin-top: 27px;
    font-size: 14px;
}

.menu ul li a{
    text-decoration: none;
    color: #fff;
    font-family: Arial;
    font-weight: bold;
    transition: 0.4s ease-in-out;
}

.menu ul li a:hover{
    color: #ff7200;
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
                     document.getElementById("input1p").innerHTML = "Please Enter Account Number";
                } 
                else{
                 document.getElementById("input1p").innerHTML = "";
                 }
            
           } 
            function inputf2() {
                var p2 = document.getElementById("input2").value;
                if (p2=="") {
                     document.getElementById("input2p").innerHTML = "Please Enter Amount";
                } 
                else{
                 document.getElementById("input2p").innerHTML = "";
                 }
            }
            
             function inputf3() {
                var p3 = document.getElementById("input3").value;
                if (p3=="") {
                     document.getElementById("input3p").innerHTML = "Please Enter User Name";
                } 
                else{
                 document.getElementById("input3p").innerHTML = "";
                 }
            }
            
   </script>
    
    
    
</head>
<body>

	<%
		response.setHeader("cache-control", "no-cache , no-store , must-revalidate");
		response.setHeader("pragma", "no-cache");
		response.setDateHeader("Expires", 0);

		if (session.getAttribute("userId") == null || session.getAttribute("token") == null) {
	%>
	<c:redirect url="/403" />
	<%
		}
	%>
	
	
	
	
	<ul id="navpart">
		
		<li><img src="css/images/logo.png" alt="logo" style=" width:200px; height:70px; padding-top:10px;padding-bottom:5px;padding-left:10px;"></li>
		
		<li style="float:right"><a class="active"  href="/logout">Logout</a></li>
		<li style="float:right"><a class="active"  href="http://localhost:8080/dashboard">Home</a></li>
	</ul>
	<br>
			
	
	
	
	
<div align="center">
<div align="center">
		<h1>CTS Bank</h1>
		</div>
		<div id="login-box">
			<div class="card  " style="width: 480px;height:580px; background: rgb(0, 0, 0); /* Fallback color */
  					background: rgba(0, 0, 0, 0.8); /* Black background with 0.5 opacity */
  					color: #f1f1f1;">
  					<br>
			<div align="center">
			<h2 class="signup" style="color:white">Customer Account Creation </h2>
			<br><br>
		</div>
			
			<form:form action="/finishedAccountCreation" method="post" modelAttribute="account">
				<label for="customerId">Enter Customer Id:</label><span class="required" style="color: red;"> *</span><br>
				<form:input type="text" class="form-control form-rounded" path="customerId" name="customerId"
					value="${customerId}" readonly="true" />
					
					
				<label style="text-align: left;">Enter Account No:</label><span class="required" style="color: red;"> *</span><br>
				<input id="input1"  type="number" class="form-control form-rounded" path="accountId" name="accountId"
					placeholder="AccountId" autocomplete="off" required="required"/>
				<p id="input1p" style="color:red"></p>
				
					
				Enter Amount:<span class="required" style="color: red;"> *</span><br>
				
				<input onclick="inputf1()" id="input2" type="number" class="form-control form-rounded" path="currentBalance" name="currentBalance" placeholder="Amount" autocomplete="off" required="required"/>
				<p id="input2p" style="color:red"></p>
				
				
				Select Account Type:<span class="required" style="color: red;"> *</span><br>
				
				<form:select type="text" class="form-select" path="accountType" placeholder="Account Type" name="accountType" autocomplete="off" required="required">
					<form:option value="Savings"></form:option>
					<form:option value="Current"></form:option>
				</form:select>
				
				Enter Owner Name:<span class="required" style="color: red;"> *</span><br>
				
				<form:input onclick="inputf2()" id="input2"  type="text" class="form-control form-rounded" path="ownerName" name="ownerName"
					placeholder="OwnerName" autocomplete="off" required="required"/>
				<p id="input3p" style="color:red"></p>
				
				
				<input type="submit" name="signup_submit" onclick="inputf3()" style="background-color:#ff652f" value="Create" />

			</form:form>
		
			<p> <a href="/dashboard?custmsg=Customer Created" >Go Back</a> and create account Later....</p>
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

</div>
	
	
	
</body>
</html>
