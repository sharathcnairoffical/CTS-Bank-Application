<%@page import="java.net.http.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!--meta http-equiv="X-UA-Compatible" content="ie=edge"-->
  <link rel="stylesheet" href="/css/log.css">
  <title>CTS Login</title>
</head>
<body>
  <div class="login-wrapper">
    <!--form action="" class="form"-->
    
    <form:form action="/login" method="post" class="form" modelAttribute="login">
    
      <img src="css/images/user.jpg" alt="image"/>
      <h2>${role} LOGIN</h2>
      <div class="input-group">
      
        <!--input type="text" name="loginUser" id="loginUser" required-->
        
        
        <form:input type="text" path="userid" name="loginUser" id="loginUser" />
        <form:label for="loginUser" path="userid" >UserId</form:label>
        
        
        
        
        
        <!--label for="loginUser">User Name</label-->
        
      </div>
      <div class="input-group">
      
      
	 <form:input type="password" path="password" name="loginPassword" id="loginPassword"/>
	 <form:label for="loginPassword" path="password" >Password</form:label>
	  
	  
      
        <!--input type="password" name="loginPassword" id="loginPassword" required>
        <label for="loginPassword">Password</label-->
      </div>
      
      <form:input type="hidden" path="role" name="role" id="role" value="${role}" />
								
	<br> <br>
								
								
      <!--input type="submit" value="Login" class="submit-btn">
    </form-->
    <br><br>
<p style="color: red;" id="errorMessage">${msg}</p>


<input  class="submit-btn" type="submit" value="Login" />
			</form:form>

  </div>
</body>
</html>