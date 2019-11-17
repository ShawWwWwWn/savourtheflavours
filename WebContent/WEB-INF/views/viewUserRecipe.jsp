<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
    <%@ page import="com.fdmgroup.model.Recipe" %>
    <%@ page import="com.fdmgroup.model.User" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Recipes</title>

<link rel="stylesheet" href=<spring:url value="/resources/css/flickity.css"/> >
	<script src=<spring:url value="/resources/js/flickity.pkgd.min.js"/>></script>
	
	 <link rel="stylesheet" href=<spring:url value="/resources/css/ProjectStyle.css"/> >
   <link rel="stylesheet" href=<spring:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/> >
   <script src=<spring:url value="http://code.jquery.com/jquery.js"/> ></script>
</head>
<body>


<script>
window.onload= function(){
	showUserRecipeMessage(${userRecipeList});
};


</script>

   <%@ include file="/WEB-INF/views/header.jsp"%>


		<p class ="userProfile" style="padding-left:25px; font-size:25px;">My Recipes</p>
		
		<div class="container3">

			<div class="recipeMatrix">
				<c:forEach items="${userRecipeList}" var="recipe">
					<div id = "userReviews" class="aRecipe aRlarge carousel-cell">
						<c:if test="${empty images.get(recipe.recipeId)}">
					<a href="viewRecipe/${recipe.recipeId}"><img class = "recipeBlock" id=${recipe.recipeId}  src=<spring:url value="/resources/images/stf_logo.png"/>></a>
						</c:if>
						<c:if test="${not empty images.get(recipe.recipeId)}">
							<a href="viewRecipe/${recipe.recipeId}"><img class="recipeBlock" id=${recipe.recipeId}  src="data:image/jpeg;base64,${images.get(recipe.recipeId)}"></a>
						</c:if>
						<a class="mTitle" href="viewRecipe/${recipe.recipeId}">${recipe.title}</a>
						<div class="descDiv">
							<a class="tDesc" href="viewRecipe/${recipe.recipeId}">${recipe.description}</a>
						</div>
						
					</div>
				</c:forEach>
				
				<div id="noRecipes">
				Sorry. There are no user added recipes.
				</div>
				
			</div>
		</div>


	<%@ include file="/WEB-INF/views/footer.jsp"%>


</body>
<script src=<spring:url value="/resources/js/savourTheFlavour.js"/> ></script>
</html>