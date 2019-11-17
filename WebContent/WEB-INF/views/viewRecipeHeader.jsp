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
	<!-- ************************Header start********************************  -->
	
	<div href="javascript:void(0)" class="searchBar searchBarViewRecipe">
      <a href=<spring:url value="/home"/> class="active">Home</a>
      <a href=<spring:url value="/showRecipeCreation"/>>Create Recipe</a>
      <a href="#about">About Us</a>
      
      <sec:authorize ifNotGranted="ROLE_USER">
      <a href=<spring:url value="/showLogin"/>>Login</a>
      </sec:authorize>
      
      <sec:authorize ifAnyGranted="ROLE_USER">
	  <div class="dropdown" style="padding:0px">
	     <button class="dropbtn"><sec:authentication property="name" /> 
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
 	  <a href=<spring:url value="/showTables"/>>Conversion Tables</a>
	  <a id="GuestOptions" style="width:150px;" onclick="toggle_visibility()">Browse</a>
      
   </div> 
   
   	<div class="Browse-Container" id="Browse-Container1"
		style="z-index: 1; top: 60px; right: 626px;">

		<div class="Browse-Categories">
			<h3 class="Search-Category">Meal Type</h3>
			<span class="icon--chevron-right"></span>
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
			<h3 class="Search-Category">Ingredient</h3>
			<span class="icon--chevron-right"></span>
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
			<h3 class="Search-Category">Cuisine Type</h3>
			<span class="icon--chevron-right"></span>
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
 
 
<%-- <%@ include file="/WEB-INF/views/conversionTables.jsp" %> --%>


 <!-- 
************************Header Finish********************************  -->
	<script src=<spring:url value="/resources/js/viewRecipeScript.js"/> ></script>
</body>
</html>