<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SavourTheFlavours</title>
<link
	href="https://fonts.googleapis.com/css?family=Montserrat&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href=<spring:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/> >
<link rel="stylesheet"
	href=<spring:url value="/resources/css/flickity.css"/>>
<script src=<spring:url value="/resources/js/flickity.pkgd.min.js"/>></script>
</head>
<body>

	<%@ include file="/WEB-INF/views/header.jsp"%>

	<div class="homeContent">
		<div class="container2">
			<div class="header">
				<a class="recipeHeads">Trending</a>
			</div>
			<div class="recipeScroll carousel js-flickity" data-flickity='{ "groupCells": true }'>
				<c:forEach items="${topRatedList}" var="recipe">
					<div class="aRecipe aRmedium carousel-cell">
						<c:if test="${empty trendingImages.get(recipe.recipeId)}">
							<a href="viewRecipe/${recipe.recipeId}"><img class = "recipeMediumBLock" src=<spring:url value="/resources/images/stf_logo.png"/>></a>
						</c:if>
						<c:if test="${not empty trendingImages.get(recipe.recipeId)}">
							<a href="viewRecipe/${recipe.recipeId}"><img class="recipeMediumBLock" src="data:image/jpeg;base64,${trendingImages.get(recipe.recipeId)}"></a>
						</c:if>
						<a class="mTitle" href="viewRecipe/${recipe.recipeId}">${recipe.title}</a>
					</div>
				</c:forEach>
			</div>
		</div>

		<div class="container2">
			<div class="header">
				<a class="recipeHeads">Most Viewed</a>
			</div>
			<div class="recipeScroll carousel js-flickity" data-flickity='{ "groupCells": true }'>
				<c:forEach items="${mostViewedList}" var="recipe">
					<div class="aRecipe aRmedium carousel-cell">
						<c:if test="${empty mostViewedImages.get(recipe.recipeId)}">
							<a href="viewRecipe/${recipe.recipeId}"><img class = "recipeMediumBLock" src=<spring:url value="/resources/images/stf_logo.png"/>></a>
						</c:if>
						<c:if test="${not empty mostViewedImages.get(recipe.recipeId)}">
							<a href="viewRecipe/${recipe.recipeId}"><img class="recipeMediumBLock" src="data:image/jpeg;base64,${mostViewedImages.get(recipe.recipeId)}"></a>
						</c:if>
						<a class="mTitle" href="viewRecipe/${recipe.recipeId}">${recipe.title}</a>
					</div>
				</c:forEach>
			</div>
		</div>

		<div class="container3">
			<!-- 			<div class="header">
				<a class="recipeHeads">Top Rated</a>
			</div> -->
			<div class="recipeMatrix">
				<c:forEach items="${trendingList}" var="recipe">
					<div class="aRecipe aRlarge carousel-cell">
						<c:if test="${empty trendingImages.get(recipe.recipeId)}">
							<a href="viewRecipe/${recipe.recipeId}"><img class = "recipeBlock" src=<spring:url value="/resources/images/stf_logo.png"/>></a>
						</c:if>
						<c:if test="${not empty trendingImages.get(recipe.recipeId)}">
							<a href="viewRecipe/${recipe.recipeId}"><img class="recipeBlock" src="data:image/jpeg;base64,${trendingImages.get(recipe.recipeId)}"></a>
						</c:if>
						<a class="mTitle" href="viewRecipe/${recipe.recipeId}">${recipe.title}</a>
						<div class="descDiv">
							<a class="tDesc" href="viewRecipe/${recipe.recipeId}">${recipe.description}</a>
						</div>
						<div class="byDiv">
							<a class="tDesc" href="viewRecipe/${recipe.recipeId}">By:
								${recipe.user.username}</a>
						</div>
						<div class="ratingsHomePage">
							<c:if test="${recipeRatings.get(recipe.recipeId) == 0}">
								<span style="font-size:20px;" class="fa fa-star"></span>
								<span style="font-size:20px;" class="fa fa-star"></span>
								<span style="font-size:20px;" class="fa fa-star"></span>
								<span style="font-size:20px;" class="fa fa-star"></span>
								<span style="font-size:20px;" class="fa fa-star"></span>
							</c:if>
						
							<c:if test="${recipeRatings.get(recipe.recipeId) >0 && recipeRatings.get(recipe.recipeId) <=0.7}">
								<span style="font-size:20px;" class="fa fa-star-half-full checked"></span>
								<span style="font-size:20px;" class="fa fa-star"></span>
								<span style="font-size:20px;" class="fa fa-star"></span>
								<span style="font-size:20px;" class="fa fa-star"></span>
								<span style="font-size:20px;" class="fa fa-star"></span>
							</c:if>
							
							<c:if test="${recipeRatings.get(recipe.recipeId) >0.7 && recipeRatings.get(recipe.recipeId) <=1.4}">
								<span style="font-size:20px;" class="fa fa-star checked"></span>
								<span style="font-size:20px;" class="fa fa-star"></span>
								<span style="font-size:20px;" class="fa fa-star"></span>
								<span style="font-size:20px;" class="fa fa-star"></span>
								<span style="font-size:20px;" class="fa fa-star"></span>
							</c:if>
							
							<c:if test="${recipeRatings.get(recipe.recipeId) >1.4 && recipeRatings.get(recipe.recipeId) <=1.9}">
								<span style="font-size:20px;" class="fa fa-star checked"></span>
								<span style="font-size:20px;" class="fa fa-star-half-full checked"></span>
								<span style="font-size:20px;" class="fa fa-star"></span>
								<span style="font-size:20px;" class="fa fa-star"></span>
								<span style="font-size:20px;" class="fa fa-star"></span>
							</c:if>
							
							<c:if test="${recipeRatings.get(recipe.recipeId) >1.9 && recipeRatings.get(recipe.recipeId) <=2.4}">
								<span style="font-size:20px;" class="fa fa-star checked"></span>
								<span style="font-size:20px;" class="fa fa-star checked"></span>
								<span style="font-size:20px;" class="fa fa-star"></span>
								<span style="font-size:20px;" class="fa fa-star"></span>
								<span style="font-size:20px;" class="fa fa-star"></span>
							</c:if>
							
							<c:if test="${recipeRatings.get(recipe.recipeId) >2.4 && recipeRatings.get(recipe.recipeId) <=2.9}">
								<span style="font-size:20px;" class="fa fa-star checked"></span>
								<span style="font-size:20px;" class="fa fa-star checked"></span>
								<span style="font-size:20px;" class="fa fa-star-half-full checked"></span>
								<span style="font-size:20px;" class="fa fa-star"></span>
								<span style="font-size:20px;" class="fa fa-star"></span>
							</c:if>
							
							<c:if test="${recipeRatings.get(recipe.recipeId) >2.9 && recipeRatings.get(recipe.recipeId) <=3.4}">
								<span style="font-size:20px;" class="fa fa-star checked"></span>
								<span style="font-size:20px;" class="fa fa-star checked"></span>
								<span style="font-size:20px;" class="fa fa-star checked"></span>
								<span style="font-size:20px;" class="fa fa-star"></span>
								<span style="font-size:20px;" class="fa fa-star"></span>
							</c:if>
							
							<c:if test="${recipeRatings.get(recipe.recipeId) >3.4 && recipeRatings.get(recipe.recipeId) <=3.9}">
								<span style="font-size:20px;" class="fa fa-star checked"></span>
								<span style="font-size:20px;" class="fa fa-star checked"></span>
								<span style="font-size:20px;" class="fa fa-star checked"></span>
								<span style="font-size:20px;" class="fa fa-star-half-full checked"></span>
								<span style="font-size:20px;" class="fa fa-star"></span>
							</c:if>
							
							<c:if test="${recipeRatings.get(recipe.recipeId) >3.9 && recipeRatings.get(recipe.recipeId) <=4.4}">
								<span style="font-size:20px;" class="fa fa-star checked"></span>
								<span style="font-size:20px;" class="fa fa-star checked"></span>
								<span style="font-size:20px;" class="fa fa-star checked"></span>
								<span style="font-size:20px;" class="fa fa-star checked"></span>
								<span style="font-size:20px;" class="fa fa-star"></span>
							</c:if>
							
							<c:if test="${recipeRatings.get(recipe.recipeId) >4.4 && recipeRatings.get(recipe.recipeId) <=4.9}">
								<span style="font-size:20px;" class="fa fa-star checked"></span>
								<span style="font-size:20px;" class="fa fa-star checked"></span>
								<span style="font-size:20px;" class="fa fa-star checked"></span>
								<span style="font-size:20px;" class="fa fa-star checked"></span>
								<span style="font-size:20px;" class="fa fa-star-half-full checked"></span>
							</c:if>
							
							<c:if test="${recipeRatings.get(recipe.recipeId) >4.9}">
								<span style="font-size:20px;" class="fa fa-star checked"></span>
								<span style="font-size:20px;" class="fa fa-star checked"></span>
								<span style="font-size:20px;" class="fa fa-star checked"></span>
								<span style="font-size:20px;" class="fa fa-star checked"></span>
								<span style="font-size:20px;" class="fa fa-star checked"></span>
							</c:if>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

	</div>



	
	

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
