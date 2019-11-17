<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <link rel="stylesheet" href=<spring:url value="/resources/css/ProjectStyle.css"/> >
   <link rel="stylesheet" href=<spring:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/> >
   <script src=<spring:url value="http://code.jquery.com/jquery.js"/> ></script>
</head>

<body>

   <div>
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
	  </div> 
      <!-- <a href=<spring:url value="/home"/>>
	     <img class="logo" src="Picture1.png" style="margin-left: 63px; width: 450px">
	  </a>  -->
	  
	  <sec:authorize ifNotGranted="ROLE_USER">  
	  <div class="login-register">
		 
            <a class="headeroption" href=<spring:url value="/showLogin"/>><b>Login</b></a>         
			<a class="headeroption" href=<spring:url value="/showRegistration"/>><b>Register</b></a>
		
	  </div>
	  </sec:authorize>
	  
	  <sec:authorize ifAnyGranted="ROLE_USER">
	  <div class="login-register">
		 
            <a class="headeroption"><b>Hello <sec:authentication property="name" /> !</b></a>
			<a class="headeroption" href=<spring:url value="/j_spring_security_logout"/>><b>Logout</b></a>
		
	  </div>
	  </sec:authorize>
	
   </div>

   <!-- Search Bar -->
   
   <div href="javascript:void(0)" class="searchBar">
      <a href=<spring:url value="/home"/> class="active" style="margin-left:-15px; width:138px">Home</a>
      <a href=<spring:url value="/showRecipeCreation"/>>Create Recipe</a>
      <a href="#about" style="width:135px">About Us</a>
      
      <sec:authorize ifAnyGranted="ROLE_USER">
	  <div class="dropdown" style="padding:0px">
	     <button class="dropbtn">My Profile 
            <i class="fa fa-caret-down"></i>
         </button>
         <div class="dropdown-content">
            <a href=<spring:url value="/viewUserRecipe"/>>My Recipes</a>
            <a href=<spring:url value="/viewFavouriteRecipe"/>>My Favourites</a>
            <a href=<spring:url value="/viewUserReviews"/>>My Reviews</a>
            <a href=<spring:url value="/viewUserProfile"/>>Update Profile</a>
            <a href=<spring:url value="/j_spring_security_logout"/>>Log Out</a>
         </div>
	  </div>
	  </sec:authorize>
	  
	  <!-- <div class="dropdown" style="padding:0px">
	     <button class="dropbtn">Conversions
            <i class="fa fa-caret-down"></i>
         </button>  
         href="#US-Dry-Volume-Measurements"
         <div class="dropdown-content">
            <a class="toggle" href="#US-Dry-Volume-Measurements" >US Dry Volume Measurements</a>
            <a class="toggle" href="#US-Liquid-Volume-Measurements">US Liquid Volume Measurements</a>
            <a class="toggle" href="#Metric-to-US-Conversions">Metric to US Conversions</a>
            <a class="toggle" href="#Pan-Size-Equivalents">Pan Size Equivalents</a>
            <a class="toggle" href="#Oven-Temperature-Conversions">Oven Temperature Conversions</a>
            <a class="toggle" href="#Butter">Butter</a>
            <a class="toggle" href="#Lemon">Lemon</a>
            <a class="toggle" href="#Chocolate">Chocolate</a>            
            <a class="toggle" href="#Creams">Creams</a>
          
         </div>
	  </div> -->
	  	  
	  <div class="searchOption" style="text-align: center; margin-right: 50px">
		 <!-- ${pageContext.request.contextPath} -->
	  <form id="recipe-form" action=<spring:url value="/searchRecipe" /> method="get" style="display:block">
         <input id="recipe-search" name="recipe-search" type="text" placeholder="Search By Recipe Name..">
		    <a id="search-switch-i" onclick="toggle_searchBy()">Ingredient</a>
         <button class="search-icon" type="submit"><i class="fa fa-search"></i></button>
      </form>
      
	  <form id="ingredient-form" action=<spring:url value="/searchIngredient" /> method="get" style="display: none">
         <input id="ingredient-search" name="ingredient-search" type="text" placeholder="Search By Ingredient..">
		    <a id="search-switch-r" onclick="toggle_searchBy()">Recipe</a>
         <button class="search-icon" type="submit"><i class="fa fa-search"></i></button>
      </form>
	  
	  </div>
 		
	  <a id="GuestOptions" style="width:131px;" onclick="toggle_visibility()">Browse</a>
      
   </div> 
   
   <div class="Browse-Container" id="Browse-Container1">
      
	  <div class="Browse-Categories">
            <h3 class="Search-Category">Meal Type</h3><span class="icon--chevron-right"></span>
               <ul class="Browse-Subcategories">
                  <li>
                     <a href=<spring:url value="/browseMealType/Breakfast" /> title="Breakfast & Brunch Recipes">Breakfast &amp; Brunch</a>
                  </li>
                  <li>
                     <a href=<spring:url value="/browseMealType/Lunch" /> title="Lunch Recipes">Lunch</a>
                  </li>				  
                  <li>
                     <a href=<spring:url value="/browseMealType/Dinner" /> title="Dinner Recipes">Dinner</a>
                  </li>				  
                  <li>
                     <a href=<spring:url value="/browseMealType/Drinks" /> title="Drink Recipes">Drinks</a>
                  </li>
                  <li>
                     <a href=<spring:url value="/browseMealType/Snacks" /> title="Desserts & Snacks Recipes">Desserts &amp; Snacks</a>
                  </li>  
               </ul>
	  </div>
	  
	  <div class="Browse-Categories">
            <h3 class="Search-Category">Ingredient</h3><span class="icon--chevron-right"></span>
               <ul class="Browse-Subcategories">
                  <li>
                     <a href="<spring:url value="/browseIngredient/Beef" />" title="Beef Recipes">Beef</a>
                  </li>
                  <li>
                     <a href="<spring:url value="/browseIngredient/Chicken" />" title="Chicken Recipes">Chicken</a>
                  </li>
                  <li>
                     <a href="<spring:url value="/browseIngredient/Pork" />" title="Pork Recipes">Pork</a>
                  </li>				  
                  <li>
                     <a href="<spring:url value="/browseIngredient/Salmon" />" title="Salmon Recipes">Salmon</a>
                  </li>				  
                  <li>
                     <a href="<spring:url value="/browseIngredient/Pasta" />" title="Pasta Recipes">Pasta</a>
                  </li>  
               </ul>
	  </div>

	  <div class="Browse-Categories" style="width: 150px;">
            <h3 class="Search-Category">Cuisine Type</h3><span class="icon--chevron-right"></span>
               <ul class="Browse-Subcategories">
                  <li>
                  <!-- /browsePlaceOfOrigin/Asian" -->
                     <a href="<spring:url value="/browsePlaceOfOrigin/Asian" />" title="Asian Recipes">Asian</a>
                  </li>
                  <li>
                     <a href="<spring:url value="/browsePlaceOfOrigin/Canadian" />" title="Canadian Recipes">Canadian</a>
                  </li>
                  <li>
                     <a href="<spring:url value="/browsePlaceOfOrigin/Indian" />" title="Indian Recipes">Indian</a>
                  </li>				  
                  <li>
                     <a href="<spring:url value="/browsePlaceOfOrigin/Italian" />" title="Italian Recipes">Italian</a>
                  </li>				  
                  <li>
                     <a href="<spring:url value="/browsePlaceOfOrigin/Mexican" />" title="Mexican Recipes">Mexican</a>
                  </li>  
               </ul>
	  </div>	  
	  
   </div>	 
 
 <script>

 function logoutFunction(){
	 
	 FB.logout(function(response) {
  	   // Person is now logged out
  });
 };
 var browse = document.getElementById("Browse-Container1");
 var browsebtn = document.getElementById("GuestOptions");
 
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

    window.onclick = function(event) {
        if (browse.style.display != 'none' && event.target != browsebtn && event.target != browse) {
             browse.style.display = 'none';
        }
      }
    
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


</script>
 
 </body>
 
 </html>