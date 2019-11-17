<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Add icon library -->
<link rel="stylesheet" href=<spring:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/> >
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href=<spring:url value="/resources/css/ProjectStyle.css"/> >
<link rel="stylesheet" href=<spring:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/> >
<script src=<spring:url value="http://code.jquery.com/jquery.js"/> ></script>
<script src=<spring:url value="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"/> ></script>
<script src=<spring:url value="/resources/js/StarBars.js"/> ></script>
<script>

window.onload = function() {
	MakeStars(${fivePercent},${fourPercent},${threePercent},${twoPercent},${onePercent});
};


</script>
<title>View Recipe</title>
</head>
<body>

	  <%@ include file="/WEB-INF/views/viewRecipeHeader.jsp" %>  
	 

	<div class="titlewrapper">
		<div id="actioncontainer">
			<a href="mailto:?subject=Look what I found on SavourTheFlavours: Join and find the best recipes!&body=%0A%0A%0Ahttps://localhost:8088/SavourTheFlavours/viewRecipe/${recipeId}"><img class="actionbar" src=<spring:url value="/resources/images/share.png"/>></a>
			<a href=<spring:url value="/download/${recipe.recipeId}/Savour%20The%20Flavours"/>><img id="middleicon" class="actionbar" src=<spring:url value="/resources/images/download.png"/>></a>
			<c:if test="${rswitch == 0}">
				<a href=<spring:url value="/favourited/${recipe.recipeId}" />><img id="emptyHeart" class="actionbar" src=<spring:url value="/resources/images/favorite.png"/>></a>
				
			</c:if>
			<c:if test="${rswitch == 1}">
				<a href=<spring:url value="/unfavourited/${recipe.recipeId}" />><img id="emptyHeart" class="actionbar" src=<spring:url value="/resources/images/favorite-clicked.png"/>></a>
			</c:if>
			<c:if test="${recipe.videoLink != NULL}">
				<a href="${recipe.videoLink}"><img id="youtubeimg" class="actionbar" src=<spring:url value="/resources/images/youtube.png"/>></a>
			</c:if>
			</br></br></br></br></br>
			<!-- <p id="favmsg">${FavouriteMsg }</p>  -->
		</div>

		
		<h1 id="recipeTitle">${recipe.title }</h1>

		<div class="infoDiv">
			<image class="imageicon" src=<spring:url value="/resources/images/preptime.png"/> > 
			<label>${recipe.prepTimeInMins}m</label>
		</div>
	
		<div class="infoDiv">
			<image class="imageicon" src=<spring:url value="/resources/images/serving.png"/> > 
			<label>${recipe.servingSize} servings </label>
		</div>
		
		<div class="infoDiv">
			<image class="imageicon" src=<spring:url value="/resources/images/origin.png"/> > 
			<label>${recipe.placeOfOrigin }</label>
		</div>
	

	</div>
	</br></br></br>
		<p id="mealinfo"> ${recipe.mealType}

			<c:if test="${recipe.isVegetarian == true}">
				| Vegetarian
			</c:if>
			<c:if test="${recipe.isVegan == true}">
				| Vegan
			</c:if>
			<c:if test="${recipe.isGlutenFree == true}">
				| Gluten Free
			</c:if>
			<c:if test="${recipe.isPeanutFree == true}">
				| Peanut Free
			</c:if>
			<c:if test="${recipe.isLactoseFree == true}">
				| Lactose Free
			</c:if>

		</p>
	</br>
	<div class="ratings">
		<c:if test="${avg == 0}">
			<span style="font-size:30px;" class="fa fa-star"></span>
			<span style="font-size:30px;" class="fa fa-star"></span>
			<span style="font-size:30px;" class="fa fa-star"></span>
			<span style="font-size:30px;" class="fa fa-star"></span>
			<span style="font-size:30px;" class="fa fa-star"></span>
		</c:if>
	
		<c:if test="${avg >0 && avg <=0.7}">
			<span style="font-size:30px;" class="fa fa-star-half-full checked"></span>
			<span style="font-size:30px;" class="fa fa-star"></span>
			<span style="font-size:30px;" class="fa fa-star"></span>
			<span style="font-size:30px;" class="fa fa-star"></span>
			<span style="font-size:30px;" class="fa fa-star"></span>
		</c:if>
		
		<c:if test="${avg >0.7 && avg <=1.4}">
			<span style="font-size:30px;" class="fa fa-star checked"></span>
			<span style="font-size:30px;" class="fa fa-star"></span>
			<span style="font-size:30px;" class="fa fa-star"></span>
			<span style="font-size:30px;" class="fa fa-star"></span>
			<span style="font-size:30px;" class="fa fa-star"></span>
		</c:if>
		
		<c:if test="${avg >1.4 && avg <=1.9}">
			<span style="font-size:30px;" class="fa fa-star checked"></span>
			<span style="font-size:30px;" class="fa fa-star-half-full checked"></span>
			<span style="font-size:30px;" class="fa fa-star"></span>
			<span style="font-size:30px;" class="fa fa-star"></span>
			<span style="font-size:30px;" class="fa fa-star"></span>
		</c:if>
		
		<c:if test="${avg >1.9 && avg <=2.4}">
			<span style="font-size:30px;" class="fa fa-star checked"></span>
			<span style="font-size:30px;" class="fa fa-star checked"></span>
			<span style="font-size:30px;" class="fa fa-star"></span>
			<span style="font-size:30px;" class="fa fa-star"></span>
			<span style="font-size:30px;" class="fa fa-star"></span>
		</c:if>
		
		<c:if test="${avg >2.4 && avg <=2.9}">
			<span style="font-size:30px;" class="fa fa-star checked"></span>
			<span style="font-size:30px;" class="fa fa-star checked"></span>
			<span style="font-size:30px;" class="fa fa-star-half-full checked"></span>
			<span style="font-size:30px;" class="fa fa-star"></span>
			<span style="font-size:30px;" class="fa fa-star"></span>
		</c:if>
		
		<c:if test="${avg >2.9 && avg <=3.4}">
			<span style="font-size:30px;" class="fa fa-star checked"></span>
			<span style="font-size:30px;" class="fa fa-star checked"></span>
			<span style="font-size:30px;" class="fa fa-star checked"></span>
			<span style="font-size:30px;" class="fa fa-star"></span>
			<span style="font-size:30px;" class="fa fa-star"></span>
		</c:if>
		
		<c:if test="${avg >3.4 && avg <=3.9}">
			<span style="font-size:30px;" class="fa fa-star checked"></span>
			<span style="font-size:30px;" class="fa fa-star checked"></span>
			<span style="font-size:30px;" class="fa fa-star checked"></span>
			<span style="font-size:30px;" class="fa fa-star-half-full checked"></span>
			<span style="font-size:30px;" class="fa fa-star"></span>
		</c:if>
		
		<c:if test="${avg >3.9 && avg <=4.4}">
			<span style="font-size:30px;" class="fa fa-star checked"></span>
			<span style="font-size:30px;" class="fa fa-star checked"></span>
			<span style="font-size:30px;" class="fa fa-star checked"></span>
			<span style="font-size:30px;" class="fa fa-star checked"></span>
			<span style="font-size:30px;" class="fa fa-star"></span>
		</c:if>
		
		<c:if test="${avg >4.4 && avg <=4.9}">
			<span style="font-size:30px;" class="fa fa-star checked"></span>
			<span style="font-size:30px;" class="fa fa-star checked"></span>
			<span style="font-size:30px;" class="fa fa-star checked"></span>
			<span style="font-size:30px;" class="fa fa-star checked"></span>
			<span style="font-size:30px;" class="fa fa-star-half-full checked"></span>
		</c:if>
		
		<c:if test="${avg >4.9}">
			<span style="font-size:30px;" class="fa fa-star checked"></span>
			<span style="font-size:30px;" class="fa fa-star checked"></span>
			<span style="font-size:30px;" class="fa fa-star checked"></span>
			<span style="font-size:30px;" class="fa fa-star checked"></span>
			<span style="font-size:30px;" class="fa fa-star checked"></span>
		</c:if>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span style="font-size:16px;">Viewed by: ${recipe.viewCount}</span>
		</br>
		<span style="font-size:18px;">${rating } reviews</span>
	</div>
	<!-- </br></br> -->
	&nbsp;&nbsp;&nbsp;&nbsp;
	<span class="recipeby">Recipe by: </span>
	<span class="recipeuser">${recipe.user.username}</span></br>
	
	&nbsp;&nbsp;&nbsp;&nbsp;
	<span class="recipeby">Date added: </span>
	<span class="recipeuser">${recipe.creationDate}</span>
	
	<c:if test="${recipe.creationDate != recipe.lastUpdatedDate}">
		</br>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<span class="recipeby">Last updated: </span>
		<span class="recipeuser">${recipe.lastUpdatedDate}</span>
	</c:if>
	
	</br></br>
	<p id="descriptionText">${recipe.description}</p>
	
	<div class="slider">
		<c:if test="${empty recipeImages}">
			<input type="radio" name="slide" id="sparx" checked/>
		    <label for="sparx">
			<img src=<spring:url value="/resources/images/stf_logo.png"/>/>
			</label>
		    <img class="biggyImage" src=<spring:url value="/resources/images/stf_logo.png"/>/>
		</c:if>
		
		<c:if test="${not empty recipeImages}">
			<c:forEach items="${recipeImages}" var="image">
					<input type="radio" name="slide" id="${image.key}" checked/>
			    	<label for="${image.key}">
					<img src="data:image/jpeg;base64,${image.value}"/>
					</label>
			    	<img class="biggyImage" src="data:image/jpeg;base64,${image.value}"/>
			</c:forEach>
		</c:if>
	</div>
	
	<h3 id="ingredientsTitle">Ingredients</h3>
	<c:set var = "unmberOfIngredients" value = "${recipe.ingredients.size()/2}"/>
	<div class="ingredientsrow">
 	 <div class="ingredientscolumn">
 	 	<ul class="ingredientsList">
 	 		<c:forEach items="${recipe.ingredients}" var="ingredient1" begin="0" end="${unmberOfIngredients}">
   				 <li class="recipeListItem">${ingredient1.quantity}${ingredient1.unit}&nbsp;&nbsp;${ingredient1.name}</li><br/>
			</c:forEach>

		</ul>
 	 </div>
 	 <div class="ingredientscolumnright">
 		 <ul class="ingredientsList">
 		 	<c:forEach items="${recipe.ingredients}" var="ingredient2" begin="${unmberOfIngredients+1}">
   				 <li class="recipeListItem">${ingredient2.quantity}${ingredient2.unit}&nbsp;&nbsp;${ingredient2.name}</li><br/>
			</c:forEach>
			
		</ul>
 	 </div>
	</div>
	
	<h3 id="ingredientsTitle" class="gapForDir">Directions</h3></br>
	<ol id="directionslist">
		<c:forEach items="${recipe.steps}" var="step">
			<li class="recipeDirectionItem"><span>${step}</span></li></br>
		</c:forEach>
	</ol>
	</br>
	
	<h3 id="specialTitle">Special Instructions</h3>
	<p id="specialInstrucs">${recipe.specialInstructions}</p></br></br>
	
	<h3 id="ingredientsTitle">Reviews</h3></br>
	<form id="review-form" action=<spring:url value="/postReview/${recipe.recipeId }"/> method="POST">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<c:choose>
			<c:when test="${user_review.starRating == 1}">
     			<span style="font-size:30px;" id ="star1" class="fa fa-star checked" onMouseOver="oneStar()" onMouseOut="noStars()" onclick="oneStarSelected()"></span>
		    	<span style="font-size:30px;" id ="star2" class="fa fa-star" onMouseOver="twoStars()" onMouseOut="noStars()" onclick="twoStarsSelected()"></span>
		   	 	<span style="font-size:30px;" id ="star3" class="fa fa-star" onMouseOver="threeStars()" onMouseOut="noStars()" onclick="threeStarsSelected()"></span>
		    	<span style="font-size:30px;" id ="star4" class="fa fa-star" onMouseOver="fourStars()" onMouseOut="noStars()" onclick="fourStarsSelected()"></span>
		    	<span style="font-size:30px;" id ="star5" class="fa fa-star" onMouseOver="fiveStars()" onMouseOut="noStars()" onclick="fiveStarsSelected()"></span>
     		</c:when>
     		
     		<c:when test="${user_review.starRating == 2}">
     			<span style="font-size:30px;" id ="star1" class="fa fa-star checked" onMouseOver="oneStar()" onMouseOut="noStars()" onclick="oneStarSelected()"></span>
		    	<span style="font-size:30px;" id ="star2" class="fa fa-star checked" onMouseOver="twoStars()" onMouseOut="noStars()" onclick="twoStarsSelected()"></span>
		   	 	<span style="font-size:30px;" id ="star3" class="fa fa-star" onMouseOver="threeStars()" onMouseOut="noStars()" onclick="threeStarsSelected()"></span>
		    	<span style="font-size:30px;" id ="star4" class="fa fa-star" onMouseOver="fourStars()" onMouseOut="noStars()" onclick="fourStarsSelected()"></span>
		    	<span style="font-size:30px;" id ="star5" class="fa fa-star" onMouseOver="fiveStars()" onMouseOut="noStars()" onclick="fiveStarsSelected()"></span>
     		</c:when>
     		
     		<c:when test="${user_review.starRating == 3}">
     			<span style="font-size:30px;" id ="star1" class="fa fa-star checked" onMouseOver="oneStar()" onMouseOut="noStars()" onclick="oneStarSelected()"></span>
		    	<span style="font-size:30px;" id ="star2" class="fa fa-star checked" onMouseOver="twoStars()" onMouseOut="noStars()" onclick="twoStarsSelected()"></span>
		   	 	<span style="font-size:30px;" id ="star3" class="fa fa-star checked" onMouseOver="threeStars()" onMouseOut="noStars()" onclick="threeStarsSelected()"></span>
		    	<span style="font-size:30px;" id ="star4" class="fa fa-star" onMouseOver="fourStars()" onMouseOut="noStars()" onclick="fourStarsSelected()"></span>
		    	<span style="font-size:30px;" id ="star5" class="fa fa-star" onMouseOver="fiveStars()" onMouseOut="noStars()" onclick="fiveStarsSelected()"></span>
     		</c:when>
     		
     		<c:when test="${user_review.starRating == 4}">
     			<span style="font-size:30px;" id ="star1" class="fa fa-star checked" onMouseOver="oneStar()" onMouseOut="noStars()" onclick="oneStarSelected()"></span>
		    	<span style="font-size:30px;" id ="star2" class="fa fa-star checked" onMouseOver="twoStars()" onMouseOut="noStars()" onclick="twoStarsSelected()"></span>
		   	 	<span style="font-size:30px;" id ="star3" class="fa fa-star checked" onMouseOver="threeStars()" onMouseOut="noStars()" onclick="threeStarsSelected()"></span>
		    	<span style="font-size:30px;" id ="star4" class="fa fa-star checked" onMouseOver="fourStars()" onMouseOut="noStars()" onclick="fourStarsSelected()"></span>
		    	<span style="font-size:30px;" id ="star5" class="fa fa-star" onMouseOver="fiveStars()" onMouseOut="noStars()" onclick="fiveStarsSelected()"></span>
     		</c:when>
     		
     		<c:when test="${user_review.starRating == 5}">
     			<span style="font-size:30px;" id ="star1" class="fa fa-star checked" onMouseOver="oneStar()" onMouseOut="noStars()" onclick="oneStarSelected()"></span>
		    	<span style="font-size:30px;" id ="star2" class="fa fa-star checked" onMouseOver="twoStars()" onMouseOut="noStars()" onclick="twoStarsSelected()"></span>
		   	 	<span style="font-size:30px;" id ="star3" class="fa fa-star checked" onMouseOver="threeStars()" onMouseOut="noStars()" onclick="threeStarsSelected()"></span>
		    	<span style="font-size:30px;" id ="star4" class="fa fa-star checked" onMouseOver="fourStars()" onMouseOut="noStars()" onclick="fourStarsSelected()"></span>
		    	<span style="font-size:30px;" id ="star5" class="fa fa-star checked" onMouseOver="fiveStars()" onMouseOut="noStars()" onclick="fiveStarsSelected()"></span>
     		</c:when>
     	<c:otherwise>	
		    <span style="font-size:30px;" id ="star1" class="fa fa-star" onMouseOver="oneStar()" onMouseOut="noStars()" onclick="oneStarSelected()"></span>
		    <span style="font-size:30px;" id ="star2" class="fa fa-star" onMouseOver="twoStars()" onMouseOut="noStars()" onclick="twoStarsSelected()"></span>
		    <span style="font-size:30px;" id ="star3" class="fa fa-star" onMouseOver="threeStars()" onMouseOut="noStars()" onclick="threeStarsSelected()"></span>
		    <span style="font-size:30px;" id ="star4" class="fa fa-star" onMouseOver="fourStars()" onMouseOut="noStars()" onclick="fourStarsSelected()"></span>
		    <span style="font-size:30px;" id ="star5" class="fa fa-star" onMouseOver="fiveStars()" onMouseOut="noStars()" onclick="fiveStarsSelected()"></span>
		 </c:otherwise>
		 </c:choose>
		 </br></br>
		 <input type="hidden" id="reviewStars" name="starRating" value="${user_review.starRating}">
		 <textarea id="commentBox" name="comment">${user_review.comments}</textarea>
		 </br><p id = "reviewWithoutStarsError">${starErrorMessage}</p>
		 
         <c:choose>		 
	     <c:when test="${hasReview}">
           <input id="reviewButton" type="submit" value="Update Review" />
         </c:when>
         <c:otherwise>
           <input id="reviewButton" type="submit" value="Post Review" />
         </c:otherwise>
         </c:choose>
     </form>
     
     <br/>
 	 
	 <c:if test="${hasReview}">
     <a id="deleteReviewButton" href=<spring:url value="/deleteReview/${recipe.recipeId}/${user_review.reviewId}"/>>Delete Review</a>
     </c:if>
     </br></br></br>
<div id="ratingSystemWrapper">    
	<span class="heading">User Rating</span>
	<c:if test="${avg == 0}">
			<span class="fa fa-star"></span>
			<span class="fa fa-star"></span>
			<span class="fa fa-star"></span>
			<span class="fa fa-star"></span>
			<span class="fa fa-star"></span>
		</c:if>
	
	<c:if test="${avg >0 && avg <=0.7}">
			<span class="fa fa-star-half-full checked"></span>
			<span class="fa fa-star"></span>
			<span class="fa fa-star"></span>
			<span class="fa fa-star"></span>
			<span class="fa fa-star"></span>
		</c:if>
		
		<c:if test="${avg >0.7 && avg <=1.4}">
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star"></span>
			<span class="fa fa-star"></span>
			<span class="fa fa-star"></span>
			<span class="fa fa-star"></span>
		</c:if>
		
		<c:if test="${avg >1.4 && avg <=1.9}">
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star-half-full checked"></span>
			<span class="fa fa-star"></span>
			<span class="fa fa-star"></span>
			<span class="fa fa-star"></span>
		</c:if>
		
		<c:if test="${avg >1.9 && avg <=2.4}">
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star"></span>
			<span class="fa fa-star"></span>
			<span class="fa fa-star"></span>
		</c:if>
		
		<c:if test="${avg >2.4 && avg <=2.9}">
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star-half-full checked"></span>
			<span class="fa fa-star"></span>
			<span class="fa fa-star"></span>
		</c:if>
		
		<c:if test="${avg >2.9 && avg <=3.4}">
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star"></span>
			<span class="fa fa-star"></span>
		</c:if>
		
		<c:if test="${avg >3.4 && avg <=3.9}">
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star-half-full checked"></span>
			<span class="fa fa-star"></span>
		</c:if>
		
		<c:if test="${avg >3.9 && avg <=4.4}">
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star"></span>
		</c:if>
		
		<c:if test="${avg >4.4 && avg <=4.9}">
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star-half-full checked"></span>
		</c:if>
		
		<c:if test="${avg >4.9}">
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
		</c:if>
	
	<p>${avg } average based on ${rating } reviews.</p>
	<hr style="border:3px solid #f1f1f1">
	
	<div class="row">
	  <div class="side">
	    <div>5 star</div>
	  </div>
	  <div class="middle">
	    <div class="bar-container">
	      <div class="bar-5"></div>
	    </div>
	  </div>
	  <div class="side right">
	    <div>${five}</div>
	  </div>
	  <div class="side">
	    <div>4 star</div>
	  </div>
	  <div class="middle">
	    <div class="bar-container">
	      <div class="bar-4"></div>
	    </div>
	  </div>
	  <div class="side right">
	    <div>${four}</div>
	  </div>
	  <div class="side">
	    <div>3 star</div>
	  </div>
	  <div class="middle">
	    <div class="bar-container">
	      <div class="bar-3"></div>
	    </div>
	  </div>
	  <div class="side right">
	    <div>${three}</div>
	  </div>
	  <div class="side">
	    <div>2 star</div>
	  </div>
	  <div class="middle">
	    <div class="bar-container">
	      <div class="bar-2"></div>
	    </div>
	  </div>
	  <div class="side right">
	    <div>${two}</div>
	  </div>
	  <div class="side">
	    <div>1 star</div>
	  </div>
	  <div class="middle">
	    <div class="bar-container">
	      <div class="bar-1"></div>
	    </div>
	  </div>
	  <div class="side right">
	    <div>${one}</div>
	  </div>
	</div>
</div> 

</br></br>

<c:forEach items="${recipeReviews}" var="review">
<c:if test="${review.comments != null}">
   <div class="reviewdiv"></br>
		<span class="reviewername">${review.user.username }</span></br></br>
		<span class="reviewdate recipeby">Date posted: ${review.creationDate}</span></br>
	    <c:if test="${review.creationDate != review.lastUpdatable}">
	    	<span class="reviewdate recipeby">Last updated: ${review.lastUpdatable}</span></br></br>
		</c:if>
	   	<c:if test="${review.starRating == 1}">
	   		&nbsp;&nbsp;
	  		<span class="fa fa-star checkedStar"></span>
			<span class="fa fa-star"></span>
			<span class="fa fa-star"></span>
			<span class="fa fa-star"></span>
			<span class="fa fa-star"></span>
			</br></br>
		</c:if>
		
		<c:if test="${review.starRating == 2}">
	   		&nbsp;&nbsp;
	  		<span class="fa fa-star checkedStar"></span>
			<span class="fa fa-star checkedStar"></span>
			<span class="fa fa-star"></span>
			<span class="fa fa-star"></span>
			<span class="fa fa-star"></span>
			</br></br>
		</c:if>
		
		<c:if test="${review.starRating == 3}">
	   		&nbsp;&nbsp;
	  		<span class="fa fa-star checkedStar"></span>
			<span class="fa fa-star checkedStar"></span>
			<span class="fa fa-star checkedStar"></span>
			<span class="fa fa-star"></span>
			<span class="fa fa-star"></span>
			</br></br>
		</c:if>
		
		<c:if test="${review.starRating == 4}">
	   		&nbsp;&nbsp;
	  		<span class="fa fa-star checkedStar"></span>
			<span class="fa fa-star checkedStar"></span>
			<span class="fa fa-star checkedStar"></span>
			<span class="fa fa-star checkedStar"></span>
			<span class="fa fa-star"></span>
			</br></br>
		</c:if>
		
		<c:if test="${review.starRating == 5}">
	   		&nbsp;&nbsp;
	  		<span class="fa fa-star checkedStar"></span>
			<span class="fa fa-star checkedStar"></span>
			<span class="fa fa-star checkedStar"></span>
			<span class="fa fa-star checkedStar"></span>
			<span class="fa fa-star checkedStar"></span>
			</br></br>
		</c:if>
		<p class="reviewbody">${review.comments} <br />
		</p>
	</div>
</c:if>
</c:forEach>
	
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<script src=<spring:url value="/resources/js/reviewScript.js"/> ></script>
	<script src=<spring:url value="/resources/js/viewRecipeScript.js"/> ></script>
	

</body>
</html>
