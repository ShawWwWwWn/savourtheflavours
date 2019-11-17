<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Google+Sans">
<title>Login</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/ProjectStyle.css">
</head>
<body onload='document.f.j_username.focus();'>

	<!-- Search Bar -->

	<div href="javascript:void(0)" class="searchBar">
		<a href="home" class="active">Home</a> 
		<a href="showRecipeCreation">Create Recipe</a> <a href="#about">About Us</a>

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

			<form id="ingredient-form" action="#searchIngredient" style="display: none">
				<input id="ingredient-search" type="text"
					placeholder="Search By Ingredient.." name="search"> <a
					id="search-switch-r" onclick="toggle_searchBy()">Recipe</a> </input>
				<button class="search-icon" type="submit">
					<i class="fa fa-search"></i>
				</button>
			</form>

		</div>

		<!-- <a id="GuestOptions" style="width: 150px;"
			onclick="toggle_visibility()">Browse</a> -->

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


		<div class="form" style="top: 150px; right: 180px">
			<h1>User Login</h1>

			<c:if test="${not empty error}">
				<div class="errorblock" style="padding-bottom: 15px; color: red;">
                     ${error}
				</div>
			</c:if>

			<form action="findUserByUsername" method="POST">
				
						<input type="text" name="username" placeholder="Please Enter Your Username">
					
					<button class="RegisterButton" type="submit">Proceed</button>
					
				 <p class="message">Not a user ? <a href=<spring:url value="/showRegistration1"/>>Register Now</a></p> 

			</form>
		</div>

	</div>

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

			if (r.style.display == 'block') {
				r.style.display = 'none';
				i.style.display = 'block';
			} else {
				r.style.display = 'block';
				i.style.display = 'none';
			}
		};

		function toggle_visibility() {
			var e = document.getElementById("Browse-Container1");
			if (e.style.display == 'block')
				e.style.display = 'none';
			else
				e.style.display = 'block';
		};

		$("#slide-show > div:gt(0)").hide();

		setInterval(function() {
			$('#slide-show > div:first').fadeOut(1600).next().fadeIn(1600)
					.end().appendTo('#slide-show');
		}, 5000);

		function validate() {

			var inputtxt = document.getElementById("firstName");
			inputtxt = inputtxt.value;
			var letters = /^[A-Za-z]+$/;
			if (letters.test(inputtxt) || event.keyCode == '8'
					|| event.keyCode == '32') {
				return true;
			} else {
				alert('Please input alphabet characters only with no space');
				return false;
			}

		}
	</script>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>