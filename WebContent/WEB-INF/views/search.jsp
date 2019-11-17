<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
    <%@ page import="com.fdmgroup.model.Recipe" %>
    <%@ page import="com.fdmgroup.model.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Recipe Search</title>
<link rel="stylesheet" href=<spring:url value="/resources/css/ProjectStyle.css"/> >
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
	<div style="margin-left:15px;margin-right:15px;padding-bottom:5px; border-bottom:1px solid #d3d3d3;">
		<form>
			<h3>Advanced Search</h3>
			<span><input type="checkbox" id="dietVegetarian" onclick="dietSearch()" value="isVegetarian"> Vegetarian |</span>
			<span><input type="checkbox" id="dietVegan" onclick="dietSearch()" value="isVegan"> Vegan |</span>
			<span><input type="checkbox" id="dietGluten" onclick="dietSearch()" value="isGlutenFree"> Gluten-Free |</span>
			<span><input type="checkbox" id="dietPeanut" onclick="dietSearch()" value="isPeanutFree"> Peanut-Free |</span>
			<span><input type="checkbox" id="dietLactose" onclick="dietSearch()" value="isLactoseFree"> Lactose-Free</span>
		</form>
	</div>
	
	<div style="margin-left:15px;">
		<h2 style="padding-top:15px;">${ListEmptyMsg }</h2>
		<h4>${ReminderMsg }</h4>
	</div>
	
	<div class="recipeMatrix">
		<c:forEach items="${recipes}" var="recipe">
			<div class="aRecipe aRlarge carousel-cell">
				<c:if test="${empty images.get(recipe.recipeId)}">
					<a href=<spring:url value="/viewRecipe/${recipe.recipeId}" />><img class = "recipeBlock" src=<spring:url value="/resources/images/placeholder.png"/>></a>
				</c:if>
				<c:if test="${not empty images.get(recipe.recipeId)}">
					<a href=<spring:url value="/viewRecipe/${recipe.recipeId}" />><img class="recipeBlock" src="data:image/jpeg;base64,${images.get(recipe.recipeId)}"></a>
				</c:if>
				<a class="mTitle" href=<spring:url value="/viewRecipe/${recipe.recipeId}" />>${recipe.title}</a>
				<div class="descDiv">
					<a class="tDesc" href=<spring:url value="/viewRecipe/${recipe.recipeId}" />>
						<c:choose>
						<c:when test="${fn:length(recipe.description) lt 50 }">
							<c:out value="${recipe.description}" />
						</c:when>
						<c:otherwise>
							<c:set var="str" value="${recipe.description }" />
							${fn:substring(str, 0, 50)} <span class="hoverColour" style="text-decoration:underline;">(Read More)</span>
						</c:otherwise>
					</c:choose>
					</a>
				</div>
				<div class="byDiv">
					<a class="tDesc" href=<spring:url value="/viewRecipe/${recipe.recipeId}" />>By: ${recipe.user.username}</a>
				</div>
				<table class="dietTbl" style="display:none">
					<tr>
						<td class="vegetarian">
			<c:choose>
				<c:when test='${recipe.isVegetarian }'>
					<c:out value="Yes" />
				</c:when>
				<c:otherwise>
					<c:out value="No" />
				</c:otherwise>
			</c:choose>
		</td>
		<td class="vegan">
			<c:choose>
				<c:when test='${recipe.isVegan }'>
					<c:out value="Yes" />
				</c:when>
				<c:otherwise>
					<c:out value="No" />
				</c:otherwise>
			</c:choose>
		</td>
		<td class="gluten">
			<c:choose>
				<c:when test='${recipe.isGlutenFree }'>
					<c:out value="No" />
				</c:when>
				<c:otherwise>
					<c:out value="Yes" />
				</c:otherwise>
			</c:choose>
		</td>
		<td class="peanut">
			<c:choose>
				<c:when test='${recipe.isPeanutFree }'>
					<c:out value="No" />
				</c:when>
				<c:otherwise>
					<c:out value="Yes" />
				</c:otherwise>
			</c:choose>
		</td>
		<td class="lactose">
			<c:choose>
				<c:when test='${recipe.isLactoseFree }'>
					<c:out value="No" />
				</c:when>
				<c:otherwise>
					<c:out value="Yes" />
				</c:otherwise>
			</c:choose>
		</td>
					</tr>
				</table>
			</div>
		</c:forEach>
	</div>
	
	<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>

 <script src=<spring:url value="/resources/js/AdvancedSearch.js"/> ></script>

</html>