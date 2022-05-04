
<html>
<head>
<title>DashBoard</title>
<!-- Required meta tags -->
<meta charset="ISO-8859-1">
<meta name="viewport"content="width=device-width, initial-scale=1, shrink-to-fit=yes">
	<link rel="stylesheet" href="/style/table.css">
                                            <!-- Bootstrap CSS -->

				
				
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
    
    
    <link rel="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js">
    <link rel="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    
    
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

				
<style>
html {
	height: 100%;
}

#message
{
	color : red; 
}
#accmsg
{
	color : green; 
}
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

/* Firefox */
input[type=number] {
  -moz-appearance: textfield;
}
			
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
			
			font-family: sans-serif;
			color:#ff652f;
			/*background: linear-gradient(to right, #610354, #053070);*/
			background-image: url('css/images/bg.jpg');
			background-size: cover;
			
			  background-repeat: no-repeat;
			  background-attachment: fixed;
			   background-size: cover;
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
			color:#ff652f;
			text-align:center
			}
		</style>


</head>
<body >


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
	</ul>
	<br>
	
		<h1 align="center" style="color:#0f0f0e; font-family: sans-serif; ">Welcome to CTS Bank</h1>
	
	<div class="row">
		
		<div class="col-xs-12 col-sm-6 col-md-4">
			<div style="margin: 5em 10em 2em 3em;">
				<div class="card  " style="width: 360px;height:250px; background-color: rgb(2, 2, 2); /* Fallback color */
  					background: rgba(0, 0, 0, 0.7); /* Black background with 0.5 opacity */
  					color: #f1f1f1;">
					<div class="card-body">
						<h4 class="card-title">Create Customer</h4><br>
						<p class="card-text">Click the button to create the customer</p>
						<!--   Button part is Incomplete  -->
						<form action="/createCustomer" method="get"><br>
                         <input type="submit" name="View" value="Create Customer" class="btn btn-primary" style="background-color:#ff652f"/>
						</form>
						
						<br> <!-- a href="/createCustomer"  ><button class="btn btn-primary" style="background-color:#ff652f; ">Create</button></a-->
					</div>
					
					<p style="color: #73ff00; padding-top:-40; padding-left: 20;" id="message"> ${custmsg}</p>
				</div>
			</div>
		</div>


		<div class="col-xs-12 col-sm-6 col-md-4">
			<div style="margin: 5em 10em 2em 3em;">
				<div class="card" style="width: 360px;height:250px; background: rgb(0, 0, 0); /* Fallback color */
  					background: rgba(0, 0, 0, 0.7); /* Black background with 0.5 opacity */
  					color: #f1f1f1;">
					<div class="card-body">
						<h4 class="card-title">Create Account for Customer</h4><br>
						<form action="/createAccount" method="post">
							<input type="text" name="customerId" placeholder="Enter the CustomerId" autocomplete="off"/>
							<br> <br> <input type="submit" name="View" value="Create Account" class="btn btn-primary" style="background-color:#ff652f" />
						</form><br>
						<p style="color: #fd000d; " id="message">${accmsg}</p>
					</div>
				</div>
			</div>
		</div>

  <div class="col-xs-12 col-sm-6 col-md-4">
			<div style="margin: 5em 10em 2em 3em;">
				<div class="card" style="width: 360px;height:250px; background: rgb(0, 0, 0); /* Fallback color */
  					background: rgba(0, 0, 0, 0.7); /* Black background with 0.5 opacity */
  					color: #f1f1f1;">
					<div class="card-body">
						<h4 class="card-title">Delete Customer</h4><br>
						<form action="/deleteCustomer" method="post">
							<input type="text" name="customerId" id="customerId" placeholder="Enter the customerId" autocomplete="off"/>
							<br> <br> <input type="submit" name="Delete" value="Delete" class="btn btn-primary" style="background-color:#ff652f" />
						</form><br>
						<p style="color: 8#f70e0e; " id="message">${deletemsg}</p>
					</div>
					
				</div>
			</div>
		</div>
	</div>


	<div class="row">

		<div class="col-xs-12 col-sm-6 col-md-4">
			<div style="margin: 4em 10em 14em 3em;">
				<div class="card" style="width:360px;height:250px; background: rgb(0, 0, 0); /* Fallback color */
  					background: rgba(0, 0, 0, 0.7); /* Black background with 0.5 opacity */
  					color: #f1f1f1;">
					<div class="card-body">
						<h4 class="card-title">View the Customer</h4><br>
						<form action="/viewCustomer" method="get">
							<input type="text" name="userId" id="userId" placeholder="Enter the CustomerId" autocomplete="off"/>
							<br> <br> <input type="submit" name="View" value="View"
								class="btn btn-primary" style="background-color:#ff652f" />
						</form>
						<p style="color: #f54545; " id="message">${viewmsg}</p>
					</div>

				</div>
			</div>
		</div>
		
		<div class="col-xs-12 col-sm-6 col-md-4">
			<div style="margin: 4em 0em 0em 3em;">
				<div class="card" style="width:360px;height:250px;background: rgb(0, 0, 0); /* Fallback color */
  					background: rgba(0, 0, 0, 0.7); /* Black background with 0.5 opacity */
  					color: #f1f1f1;">
					<div class="card-body">
						<h4 class="card-title">Deposit Amount</h4>
						<form action="/deposit" method="post">
							<input type="number"  name="accountId" placeholder="Enter the AccountId" autocomplete="off"/><br><br>	
							<input type="number" name="amount" placeholder="Enter the amount" autocomplete="off"/>
							<br> <br>
							<input type="submit" name="View" value="Deposit Amount" class="btn btn-primary" style="background-color:#ff652f" />
						</form>
						<p style="color: #12fd0a; " id="message">${msg}</p>
						
					</div>
				</div>
			</div>
		</div>

        <div class="col-xs-12 col-sm-6 col-md-4">
			<div style="margin: 4em 10em 14em 3em;">
				<div class="card" style="width:360px;height:250px; background: rgb(0, 0, 0); /* Fallback color */
  					background: rgba(0, 0, 0, 0.7); /* Black background with 0.5 opacity */
  					color: #f1f1f1;">
					<div class="card-body">
						<h4 class="card-title">Service Charge Detection</h4>
                        <p class="card-text">Charges will be detected for not maintaining minimum balance </p>
						<form action="/deductServiceTax" method="post"><br>
                         <input type="submit" name="View" value="Deduct" class="btn btn-primary" style="background-color:#ff652f"/>
						</form>
						<p style="color: #06f111; " id="message">${servicemsg}</p>
					</div>
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

</div>
	
   
	

</body>
</html>
