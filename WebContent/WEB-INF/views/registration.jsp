<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Google+Sans">
<title>Registration</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/ProjectStyle.css">
</head>
<body>


   <!-- <div>
      <p class="logo-text">
         Savour The Flavours
      </p>
   </div>

   <div class="header">
      <div id="slide-show">
	     <div>
		    <img class = "ImageGallery" src=<spring:url value="/resources/images/JapFood.jpg"/> >
	     </div>
	     <div>
		    <img class = "ImageGallery" src=<spring:url value="/resources/images/IndianFood.jpg"/> >
	     </div>	 
		 <div>
		    <img class = "ImageGallery" src=<spring:url value="/resources/images/ItalianFood.jpg"/> >
	     </div>	 
	  </div> -->
	<!-- Search Bar -->

	<div href="javascript:void(0)" class="searchBar">
		<a href=<spring:url value="/home"/> class="active">Home</a> 
		<a href="showRecipeCreation">Create Recipe</a>
		<!-- <a href="showallrecipes">All Recipes</a> -->
		<a href="#about">About Us</a>

		
		<div class="searchOption"
			style="text-align: center; margin-right: 50px">

			<form id="recipe-form" action="#searchRecipe" style="display: block">
				<input id="recipe-search" type="text"
					placeholder="Search By Recipe Name.." name="search"> <a
					id="search-switch-i" onclick="toggle_searchBy()">Ingredient</a> </input>
				<button class="search-icon" type="submit">
					<i class="fa fa-search"></i>
				</button>
			</form>

			<form id="ingredient-form" action="#searchIngredient"
				style="display: none">
				<input id="ingredient-search" type="text"
					placeholder="Search By Ingredient.." name="search"> <a
					id="search-switch-r" onclick="toggle_searchBy()">Recipe</a> </input>
				<button class="search-icon" type="submit">
					<i class="fa fa-search"></i>
				</button>
			</form>

		</div>

		

	</div>

	<div class="Browse-Container" id="Browse-Container1"
		style="z-index: 1; top: 60px; right: 626px;">

		<div class="Browse-Categories">
			<h3 class="Search-Category">Meal Type</h3>
			<span class="icon--chevron-right"></span>
			<ul class="Browse-Subcategories">
				<li><a href="" title="Appetizers & Snacks Recipes">Appetizers
						&amp; Snacks</a></li>
				<li><a href="" title="Breakfast & Brunch Recipes">Breakfast
						&amp; Brunch</a></li>
				<li><a href="" title="Desert Recipes">Desserts</a></li>
				<li><a href="" title="Dinner Recipes">Dinner</a></li>
				<li><a href="" title="Drink Recipes">Drinks</a></li>
			</ul>
		</div>

		<div class="Browse-Categories">
			<h3 class="Search-Category">Ingredient</h3>
			<span class="icon--chevron-right"></span>
			<ul class="Browse-Subcategories">
				<li><a href="" title="Beef Recipes">Beef</a></li>
				<li><a href="" title="Chicken Recipes">Chicken</a></li>
				<li><a href="" title="Pork Recipes">Pork</a></li>
				<li><a href="" title="Salmon Recipes">Salmon</a></li>
				<li><a href="" title="Pasta Recipes">Pasta</a></li>
			</ul>
		</div>

		<div class="Browse-Categories" style="width: 150px;">
			<h3 class="Search-Category">Cuisine Type</h3>
			<span class="icon--chevron-right"></span>
			<ul class="Browse-Subcategories">
				<li><a href="" title="Asian Recipes">Asian</a></li>
				<li><a href="" title="Canadian Recipes">Canadian</a></li>
				<li><a href="" title="Indian Recipes">Indian</a></li>
				<li><a href="" title="Italian Recipes">Italian</a></li>
				<li><a href="" title="Mexican Recipes">Mexican</a></li>
			</ul>
		</div>

	</div>

	<div class="RegisterGallery">
		<div>
			<img class="RegisterImageGallery" src="resources/images/RegisterImage.jpg">
		</div>
		<div class="login-page">
			<div class="RegisterText">Make friends with food</div>
			<div class="RegisterUnderText">Recipes from your favourite
				chefs and home cooks</div>

		</div>

		<div class="form">

			<sf:form action="register" method="POST" modelAttribute="user">
                <h4>${error1}</h4>
                <h4>${error2}</h4>
				<%--  <sf:label path="email">email</sf:label> --%>
				<sf:input path="email" id="email" required="required" type="email" pattern="[a-zA-Z0-9._]+@[a-z0-9.-]+\.[a-z]{2,}$"	placeholder="email@company.domain" onfocusout="validate('email')" title="Please use a valid email address."/><br />

				<%-- <sf:label path="fName" >First Name</sf:label>  --%>
				<sf:input path="fName" id="firstName" required="required" type="text" placeholder="First Name"  pattern="[a-zA-Z]{1,}$" onfocusout="validate('firstName')" title="First Name should only have letters."/><br />

				<%-- 	<sf:label path="lName">Last Name</sf:label> --%>
				<sf:input path="lName" id="lastName" required="required" type="text" placeholder="Last Name" pattern="[a-zA-Z]{1,}$" onfocusout="validate('lastName')" title="Last Name should only have letters."/><br />

				<%-- <sf:label path="username">User Name</sf:label> --%>
				<sf:input path="username" id="userName" required="required"	type="text" placeholder="User Name" /><br />

				<%-- <sf:label path="enabled"></sf:label> --%>
				<sf:input path="enabled" type="hidden" value="1" /><br />
				<!-- ??? test: true or 1 -->

				<%-- <sf:label path="password">Enter Password</sf:label> --%>
				<sf:input path="password" id="password"  required="required" type="password" placeholder="Password" /><br />

				<%-- <sf:label path="confirmPassword">Re-Enter Password</sf:label> --%>
				<input class="confirmPassword" id="confirmPassword"  required="required" type="password"	placeholder="Confirm-Password" /><br />

				<%-- 	<sf:label path="securityQ1">What's your Birth Place?</sf:label> --%>
				<sf:select id="Q1" path="securityQ1" required="required" type="text">


					<option  value=""disabled selected>-SecurityQuestion1-</option>


					<option value="Your best friend's name?">Your Best Friend's Name?</option>
					<option value="What's your Birth Place?">What's your Birth Place?</option>
					<option value="Who was your childhood hero?">Who was your childhood hero?</option>
				</sf:select>


				<sf:input id="answer1" path="Answer1" required="required" type="text" placeholder="Answer1" />
				<br />



				<%-- <sf:label path="securityQ2">What's the name of your first pet?</sf:label> --%>


				<sf:select id="Q2" path="securityQ2" required="required"  type="text" >
					<option  value="" disabled selected>-SecurityQuestion2-</option>

					<option value="Your favourite Teachers Name?">Your favourite Teachers Name?</option>
					<option value="What's your favourite movie?">What's your favourite movie?</option>
					<option value="What street did you live on in third grade?">What street did you live on in third grade?</option>
				</sf:select>

				<sf:input id="Answer2" path="answer2" required="required" type="text" placeholder="Answer2" /><br />

				<%-- <sf:label path="securityQ3">What's your mom's maiden name? </sf:label> --%>


				<sf:select id="Q3" path="securityQ3" required="required"  type="text" >
					<option  value="" disabled selected>-SecurityQuestion3-</option>


					<option value="Your Name of your Idol?">Who's your Idol?</option>
					<option value="What's your favourite movie?">What's your favourite movie?</option>
					<option value="In what city was your first job?">In what city was your first job?</option>
				</sf:select>


				<sf:input id="Answer3" path="answer3" required="required" type="text" placeholder="Answer3" /><br />
				<button class="RegisterButton" type="submit" value="register">Register</button>
				<p class="message">Already Registered?<a href=<spring:url value="/showLogin1"/>>Sign In</a></p> 
			</sf:form>

			<div class="FB-Login-Button" style="margin-top: 20px">
			
			
			
			
				<script>
  
  // This is called with the results from from FB.getLoginStatus().
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
   
    if (response.status === 'connected') {
      // Logged into your app and Facebook.
      testAPI();
    } else {
      // The person is not logged into your app or we are unable to tell.
      document.getElementById('status').innerHTML = '';
    }
  }

  // This function is called when someone finishes with the Login
  // Button.  See the onlogin handler attached to it in the sample
  // code below.
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1540472366089290',
      cookie     : true,  // enable cookies to allow the server to access 
                          // the session
      xfbml      : true,  // parse social plugins on this page
      version    : 'v3.3' // The Graph API version to use for the call
    });

    // Now that we've initialized the JavaScript SDK, we call 
    // FB.getLoginStatus().  This function gets the state of the
    // person visiting this page and can return one of three states to
    // the callback you provide.  They can be:
    //
    // 1. Logged into your app ('connected')    // 2. Logged into Facebook, but not your app ('not_authorized')
    // 3. Not logged into Facebook and can't tell if they are logged into
    //    your app or not.
    //
    // These three cases are handled in the callback function.

    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });

  };

  // Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  // Here we run a very simple test of the Graph API after login is
  // successful.  See statusChangeCallback() for when this call is made.
  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', {fields: 'name,first_name,last_name,email'}, function(response) {
      console.log('Successful login for: ' + response.name);
      document.getElementById('fbbb').innerText ='Welcome ' + response.first_name + " !";
      document.getElementById("email").value = response.email;
      document.getElementById("firstName").value = response.first_name;
      document.getElementById("lastName").value = response.last_name;
      document.getElementById("userName").value = response.name;
    });
  }
</script src="resources/js/savourTheFlavour.js" type="text/javascript">

				<!--
  Below we include the Login Button social plugin. This button uses
  the JavaScript SDK to present a graphical Login button that triggers
  the FB.login() function when clicked.
-->

				<fb:login-button id="fbbb"
					scope="public_profile,email,manage_pages,publish_pages"
					onlogin="checkLoginState();">Connect With Facebook
</fb:login-button>

				<div id="status"></div>

			</div>
		</div>
	</div>
	</div>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script>
 
    var password1 = document.getElementById('password');
    var password2 = document.getElementById('confirmPassword');

    var checkPasswordValidity = function() {
        if (password1.value != password2.value) {
            password1.setCustomValidity('Passwords must match.');
        } else {
            password1.setCustomValidity('');
        }        
    };

    password1.addEventListener('change', checkPasswordValidity, false);
    password2.addEventListener('change', checkPasswordValidity, false);

    var form = document.getElementById('user');
    form.addEventListener('submit', function() {
        checkPasswordValidity();
        if (!this.checkValidity()) {
            event.preventDefault();
            //Implement you own means of displaying error messages to the user here.
            password1.focus();
        }
    }, false);
    
    function toggle_searchBy() {
        var i = document.getElementById("ingredient-form");
 	   var r = document.getElementById("recipe-form");
 	   
        if(r.style.display == 'block'){
           r.style.display = 'none';
 		  i.style.display = 'block';}
        else {
           r.style.display = 'block';
 		  i.style.display = 'none'; }
     };

     function toggle_visibility() {
        var e = document.getElementById("Browse-Container1");
        if(e.style.display == 'block')
           e.style.display = 'none';
        else
           e.style.display = 'block';
     };

 $("#slide-show > div:gt(0)").hide();

 setInterval(function() {
   $('#slide-show > div:first')
     .fadeOut(1600)
     .next()
     .fadeIn(1600)
     .end()
     .appendTo('#slide-show');
 }, 5000);

 
/*  function validate(){
	 
	 var inputtxt=document.getElementById("firstName");
	 inputtxt=inputtxt.value;
	 var letters = /^[A-Za-z]+$/;
	 if(letters.test(inputtxt) || event.keyCode=='8' || event.keyCode=='32')
	 {
			return true;
	 }
	 else
	 {
	 	alert('Please input alphabet characters only with no space');
	 	return false;
	 }
	 
 } */
 
 
 
function validateEmail(){
	 
	 var inputtxt=document.getElementById("email");
	 inputtxt=inputtxt.value;
	 var letters = /[a-zA-Z0-9._]+@[a-z0-9.-]+\.[a-z]{2,}$/;
	 if(letters.test(inputtxt) || event.keyCode=='8' || event.keyCode=='32')
	 {
			return true;
	 }
	 else
	 {
	 	alert('Email should have no space and must be a valid email');
	 	return false;
	 }
	 
 }  
</script>
<script src="resources/js/savourTheFlavour.js" type="text/javascript"></script>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>