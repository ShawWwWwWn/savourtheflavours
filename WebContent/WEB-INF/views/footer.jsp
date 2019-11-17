<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <link rel="stylesheet" href=<spring:url value="/resources/css/ProjectStyle.css"/> >
   <link rel="stylesheet" href=<spring:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/> >
   <script src=<spring:url value="http://code.jquery.com/jquery.js"/> ></script>
</head>

<body>
	 

   <footer id="about" class="footer-distributed">

		<div class="footer-left" style="width:30%">

        <image class="logo-bottom" src=<spring:url value="/resources/images/Picture1.png"/> style="margin-left: 2%; width: 100%"> 

			<p class="footer-links">
				<a href="${contextPath}/SavourTheFlavours/home">Home</a>
				
				<a href="#">Create Recipe</a>
				
				<a href="#">All Recipes</a>
				
				<a href="#">About Us</a>
				
				<a href="#">FAQ</a>
				
				<a href="#">Contact</a>
			</p>


			<p class="footer-company-name" style="margin-top:20px">&copy; 2019 Savour The Flavours all rights reserved</p>			
			
		</div>

		<div class="footer-right">

			<p>Contact Us</p>

			<form>

				<input type="text" name="email" placeholder="Email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"/>
				<textarea name="message" placeholder="Message"></textarea>
				<button onclick="messageAlert()" type="reset">Send</button>

			</form>

		</div>

		</footer>
<script>
function messageAlert() {
	  alert("Your message has been received. We will get back to you shortly!");
	}

</script>


</body>


</html>