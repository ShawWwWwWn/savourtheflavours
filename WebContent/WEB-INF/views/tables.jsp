
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
<title>Tables</title>
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
		<a href=<spring:url value="/home"/> class="active" style="margin-left:-15px; width:138px">Home</a>
      <a href=<spring:url value="/showRecipeCreation"/>>Create Recipe</a>
		<!-- <a href="showallrecipes">All Recipes</a> -->
		<div class="dropdown" style="padding:0px">
	     <button class="dropbtn">Conversions
            <i class="fa fa-caret-down"></i>
         </button>  
        <!--  href="#US-Dry-Volume-Measurements" -->
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
	  </div>
		<a href="#about">About Us</a>
		
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
		<!-- <div>
			<img class="RegisterImageGallery" src="resources/images/RegisterImage.jpg">
		</div> -->
		<section id="US-Dry-Volume-Measurements"> <!--for demo wrap-->
	<h1 class="headerTable">US Dry Volume Measurements</h1>
	<div class="tbl-header">
		<table cellpadding="0" cellspacing="0" border="0">
			<thead>
				<tr>
					<th>MEASURE</th>
					<th>EQUIVALENT</th>

				</tr>
			</thead>
		</table>
	</div>
	<div class="tbl-content">
		<table cellpadding="0" cellspacing="0" border="0">
			<tbody>
				<tr>
					<td>1/16 teaspoon</td>
					<td>dash</td>

				</tr>
				<tr>
					<td>1/8 teaspoon</td>
					<td>a pinch</td>

				</tr>
				<tr>
					<td>3 teaspoons</td>
					<td>1 Tablespoon</td>

				</tr>
				<tr>
					<td>1/8 cup</td>
					<td>2 tablespoons (= 1 standard coffee scoop)</td>
				</tr>
				<tr>
					<td>1/4 cup</td>
					<td>4 Tablespoons</td>

				</tr>
				<tr>
					<td>1/3 cup</td>
					<td>5 Tablespoons plus 1 teaspoon</td>

				</tr>
				<tr>
					<td>1/2 cup</td>
					<td>8 Tablespoons</td>
				</tr>
				<tr>
					<td>3/4 cup</td>
					<td>12 Tablespoons</td>

				</tr>
				<tr>
					<td>1 cup</td>
					<td>16 Tablespoons</td>

				</tr>
				<tr>
					<td>1 Pound</td>
					<td>16 ounces</td>

				</tr>


			</tbody>
		</table>
	</div>
	</section>

	<section id="US-Liquid-Volume-Measurements"> <!--for demo wrap-->
	<h1 class="headerTable">US Liquid Volume Measurements</h1>
	<div class="tbl-header">
		<table cellpadding="0" cellspacing="0" border="0">
			<thead>
				<tr>
					<th>MEASURE</th>
					<th>EQUIVALENT</th>
				</tr>
			</thead>
		</table>
	</div>
	<div class="tbl-content">
		<table cellpadding="0" cellspacing="0" border="0">
			<tbody>
				<tr>
					<td>8 Fluid ounces</td>
					<td>1 Cup</td>
				</tr>
				<tr>
					<td>1 Pint</td>
					<td>2 Cups (= 16 fluid ounces)</td>

				</tr>
				<tr>
					<td>1 Quart</td>
					<td>2 Pints (= 4 cups)</td>

				</tr>
				<tr>
					<td>1 Gallon</td>
					<td>4 Quarts (= 16 cups)</td>
				</tr>

			</tbody>
		</table>
	</div>
	</section>


	<section id="Metric-to-US-Conversions"> <!--for demo wrap-->
	<h1 class="headerTable">Metric to US Conversions</h1>
	<div class="tbl-header">
		<table cellpadding="0" cellspacing="0" border="0">
			<thead>
				<tr>
					<th>MEASURE</th>
					<th>EQUIVALENT</th>
				</tr>
			</thead>
		</table>
	</div>
	<div class="tbl-content">
		<table cellpadding="0" cellspacing="0" border="0">
			<tbody>
				<tr>
					<td>1 milliliter</td>
					<td>1/5 teaspoon</td>
				</tr>
				<tr>
					<td>5 ml</td>
					<td>1 teaspoon</td>
				</tr>
				<tr>
					<td>15 ml</td>
					<td>1 tablespoon</td>
				</tr>
				<tr>
					<td>30 ml</td>
					<td>1 fluid oz.</td>
				</tr>
				<tr>
					<td>100 ml</td>
					<td>3.4 fluid oz.</td>
				</tr>
				<tr>
					<td>240 ml</td>
					<td>1 cup</td>

				</tr>
				<tr>
					<td>1 liter</td>
					<td>34 fluid oz.</td>
				</tr>
				<tr>
					<td>1 liter</td>
					<td>4.2 cups</td>
				</tr>
				<tr>
					<td>1 liter</td>
					<td>2.1 pints</td>
				</tr>
				<tr>
					<td>1 liter</td>
					<td>1.06 quarts</td>
				</tr>
				<tr>
					<td>1 liter</td>
					<td>.26 gallon</td>
				</tr>
				<tr>
					<td>1 gram</td>
					<td>.035 ounce</td>
				</tr>
				<tr>
					<td>100 grams</td>
					<td>3.5 ounces</td>
				</tr>
				<tr>
					<td>500 grams</td>
					<td>1.10 pounds</td>
				</tr>
				<tr>
					<td>1 kilogram</td>
					<td>2.205 pounds</td>
				</tr>
				<tr>
					<td>1 kilogram</td>
					<td>35 oz.</td>
				</tr>
			</tbody>
		</table>
	</div>
	</section>

	<section id="Pan-Size-Equivalents"> <!--for demo wrap-->
	<h1 class="headerTable">Pan Size Equivalents</h1>
	<div class="tbl-header">
		<table cellpadding="0" cellspacing="0" border="0">
			<thead>
				<tr>
					<th>MEASURE</th>
					<th>EQUIVALENT</th>
				</tr>
			</thead>
		</table>
	</div>
	<div class="tbl-content">
		<table cellpadding="0" cellspacing="0" border="0">
			<tbody>
				<tr>
					<td>9-by-13-inches baking dish</td>
					<td>22-by-33-centimeter baking dish</td>
				</tr>
				<tr>
					<td>8-by-8-inches baking dish</td>
					<td>20-by-20-centimeter baking dish</td>
				</tr>
				<tr>
					<td>9-by-5-inches loaf pan</td>
					<td>23-by-12-centimeter loaf pan (=8 cups or 2 liters in
						capacity)</td>
				</tr>
				<tr>
					<td>10-inch tart or cake pan</td>
					<td>25-centimeter tart or cake pan</td>
				</tr>
				<tr>
					<td>9-inch cake pan</td>
					<td>22-centimeter cake pan</td>
				</tr>

			</tbody>
		</table>
	</div>
	</section>

	<section id="Oven-Temperature-Conversions"> <!--for demo wrap-->
	<h1 class="headerTable">Oven Temperature Conversions</h1>
	<div class="tbl-header">
		<table cellpadding="0" cellspacing="0" border="0">
			<thead>
				<tr>
					<th>Farenheit</th>
					<th>Celsius</th>
					<th>Gas Mark</th>
				</tr>
			</thead>
		</table>
	</div>
	<div class="tbl-content">
		<table cellpadding="0" cellspacing="0" border="0">
			<tbody>
				<tr>
					<td>275º F</td>
					<td>140º C</td>
					<td>gas mark 1-cool</td>
				</tr>
				<tr>
					<td>300º F</td>
					<td>150º C</td>
					<td>gas mark 2</td>
				</tr>
				<tr>
					<td>325º F</td>
					<td>165º C</td>
					<td>gas mark 3-very moderate</td>
				</tr>
				<tr>
					<td>350º F</td>
					<td>180º C</td>
					<td>gas mark 4-moderate</td>
				</tr>
				<tr>
					<td>375º F</td>
					<td>190º C</td>
					<td>gas mark 5</td>
				</tr>
				<tr>
					<td>400º F</td>
					<td>200º C</td>
					<td>gas mark 6-moderately hot</td>
				</tr>
				<tr>
					<td>425º F</td>
					<td>220º C</td>
					<td>gas mark 7- hot</td>
				</tr>
				<tr>
					<td>450º F</td>
					<td>230º C</td>
					<td>gas mark 9</td>
				</tr>
				<tr>
					<td>475º F</td>
					<td>240º C</td>
					<td>gas mark 10- very hot</td>
				</tr>
			</tbody>
		</table>
	</div>
	</section>
	<!-- ***********Ratios for selected foods Butter************** -->

	<section id="Butter"> <!--for demo wrap-->
	
	<h3 class="headerTable">Butter</h3>
	<div class="tbl-header">
		<table cellpadding="0" cellspacing="0" border="0">
			<thead>
				<tr>
					<th>Measure</th>
					<th>Equivalents</th>
				</tr>
			</thead>
		</table>
	</div>
	<div class="tbl-content">
		<table cellpadding="0" cellspacing="0" border="0">
			<tbody>
				<tr>
					<td>1 T.</td>
					<td>14 grams</td>
					<td>1 Tablespoon</td>
					<td>½ cup</td>
				</tr>
				<tr>
					<td>1 stick</td>
					<td>4 ounces=113 grams</td>
					<td>8 tablespoons</td>
					<td>½ cup</td>
				</tr>
				<tr>
					<td>4 sticks</td>
					<td>16 ounces=452 grams</td>
					<td>32 tablespoons</td>
					<td>2 cups</td>
				</tr>
			</tbody>
		</table>
	</div>
	</section>

	<!-- ***********Ratios for selected foods Lemon************** -->
	<section id="Lemon"> <!--for demo wrap--> <!-- <h1 class="headerTable">Ratios for selected foods</h1> -->
	<h3 class="headerTable">Lemon</h3>
	<div class="tbl-header">
		<table cellpadding="0" cellspacing="0" border="0">
			<thead>
				<tr>
					<th>Measure</th>
					<th>Equivalents</th>
				</tr>
			</thead>
		</table>
	</div>
	<div class="tbl-content">
		<table cellpadding="0" cellspacing="0" border="0">
			<tbody>
				<tr>
					<td>1 lemon</td>
					<td>1 to 3 tablespoons juice, 1 to 1½ teaspoons grated zest</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>4 large lemons</td>
					<td>1 cup juice</td>
					<td>¼ cup grated zest</td>
					<td></td>
				</tr>

			</tbody>
		</table>
	</div>
	</section>
	<!-- ***********Ratios for selected foods Chocolate************** -->
	<section id="Chocolate">
	<h3 class="headerTable">Chocolate</h3>
	<div class="tbl-header">
		<table cellpadding="0" cellspacing="0" border="0">
			<thead>
				<tr>
					<th>Measure</th>
					<th>Equivalents</th>
				</tr>
			</thead>
		</table>
	</div>
	<div class="tbl-content">
		<table cellpadding="0" cellspacing="0" border="0">
			<tbody>
				<tr>
					<td>1 ounce</td>
					<td>¼ cup grated 40 grams</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>6 ounces chips</td>
					<td>1 cup chips 160 grams</td>
					<td></td>
					<td></td>
				</tr>

				<tr>
					<td>cocoa powder</td>
					<td>1 cup 115 grams</td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>
	</section>

	<section id="Creams"> <!--for demo wrap-->
	<h3 class="headerTable">Creams</h3>
	<div class="tbl-header">
		<table cellpadding="0" cellspacing="0" border="0">
			<thead>
				<tr>
					<th>Measure</th>
					<th>Equivalents</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
		</table>
	</div>
	<div class="tbl-content">
		<table cellpadding="0" cellspacing="0" border="0">
			<tbody>
				<tr>
					<td>Half and half</td>
					<td> ½ milk ½ cream</td>
					<td>10.5 to 18 % butterfat</td>
					<td></td>
				</tr>
				<tr>
					<td>Light cream</td>
					<td></td>
					<td>18 % butterfat</td>
					<td></td>
				</tr>
				<tr>
					<td>Light whipping cream</td>
					<td></td>
					<td>26-30 % butterfat</td>
					<td></td>
				</tr>
				<tr>
					<td>Heavy cream</td>
					<td>whipping cream</td>
					<td>36 % or more butterfat</td>
					<td></td>
				</tr>
				<tr>
					<td>Double cream</td>
					<td>extra-thick double cream, Clotted or Devonshire</td>
					<td>42 % butterfat</td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>
	</section>

		
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
<script>

var sec1 = document.getElementById("US-Dry-Volume-Measurements");
var sec2 = document.getElementById("US-Liquid-Volume-Measurements");
var sec3 = document.getElementById("Metric-to-US-Conversions");
var sec4 = document.getElementById("Pan-Size-Equivalents");
var sec5 = document.getElementById("Oven-Temperature-Conversions");
var sec6 = document.getElementById("Butter");
var sec7 = document.getElementById("Lemon");
var sec8 = document.getElementById("Chocolate");
var sec9 = document.getElementById("Creams");



//var tables = document.getElementsByTagName("section");

var Creams
var show = function (elem) {
	elem.style.display = 'block';
};

var hide = function (elem) {
	elem.style.display = 'none';
};

var toggle = function (elem) {

	// If the element is visible, hide it
	if (window.getComputedStyle(elem).display === 'block') {
		hide(elem);
		return;
	}

	// Otherwise, show it
	show(elem);
	

};

// Listen for click events
document.addEventListener('click', function (event) {

	// Make sure clicked element is our toggle
	if (!event.target.classList.contains('toggle')) return;

	// Prevent default link behavior
	event.preventDefault();

	// Get the content
	var content = document.querySelector(event.target.hash);
	if (!content) return;

	// Toggle the content
	/* for(int i = 0; i < tables.length; i++) {
		hide(tables[i]);
	} */
	
	sec1.style.display = 'none';
	sec2.style.display = 'none';
	sec3.style.display = 'none';
	sec4.style.display = 'none';
	sec5.style.display = 'none';
	sec6.style.display = 'none';
	sec7.style.display = 'none';
	sec8.style.display = 'none';
	sec9.style.display = 'none';
	
	toggle(content);

}, false);

</script>

</html>