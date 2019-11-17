<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/SavourTheFlavours/resources/css/CheckmarkStyle.css" >
<title>Create A Recipe</title>
</head>
<body>

	<%@ include file="/WEB-INF/views/header.jsp" %>

<%--
Restrictions:
Title cannot be longer than 30 characters.
Title is alphanumeric, also allowing the characters :{,.;'"()!%-$+ }
Title cannot be blank.

Description can be blank.
Description cannot be longer than 255 characters
Description is alphanumeric, also allowing the characters :{,.;'"()!%-$+ }

First Ingredient is required.
Ingredient name is letters only, max length of 30
Ingredient quantity is numbers only

Prep Time in Minutes is numbers only with a max length of 3 from 0-255, also required

Serving size is numbers only with a max length of 3 from 0-255, also required

Place of Origin is alphanumeric with a max length of 255, also allowing the characters :{,.;'"()!%-$+ }

Special instructions is alphanumeric with a max length of 255, also allowing the characters :{,.;'"()!%-$+ }

videoLink is restricted to youtube links only, allowing the omission of http:// or https:// and www
 --%>
<div class="recipe-submission-form">
	<sf:form name="recipe-creation-form" class="create-form" method="POST" action="create" modelAttribute="recipe" enctype="multipart/form-data">
		
		<div class="cr1 crDis">
			<sf:label path="title" class="create-text">Name (Required)</sf:label>
			<sf:input path="title" onfocusout="validate('title')" class="create-text-input" required="required" maxlength="255" placeholder="No more than 255 characters" pattern="[0-9a-zA-Z,.;\/'\"()!%\-$+ ]*" title="Please use alphanumeric characters."/><br>
			
			<sf:label path="description" class="create-text">Description (Required)</sf:label>
			<sf:textarea path="description" onfocusout="validate('description')" class="create-text-input" maxlength="255" placeholder="No more than 255 characters" pattern="[0-9a-zA-Z,.;\/'\"()!%\-$+ ]*" title="Please use alphanumeric characters."/><br>
		</div>

    	<!-- <div ><button type="button" onclick="replicateImageUpload()">Add Another Image</button></div> -->
		
		<div class="cr3 crDis">
			<sf:label path="prepTimeInMins" class="create-text">Prep Time (Mins)</sf:label>
			<sf:input path="prepTimeInMins" class="create-text-input" onfocusout="validate('prepTimeInMins')" pattern="^([01]?[0-9]?[0-9]|2[0-4][0-9]|25[0-5])$" placeholder="0-255" maxlength="3" required="required" title="0-255"/><br>
			
			<sf:label path="servingSize" class="create-text">Serving Size</sf:label>
			<sf:input path="servingSize" class="create-text-input" onfocusout="validate('servingSize')" pattern="^([01]?[0-9]?[0-9]|2[0-4][0-9]|25[0-5])$" placeholder="0-255" maxlength="3" required="required" title="0-255"/><br>
			
			<sf:hidden path="viewCount"></sf:hidden>
			
			<sf:label path="placeOfOrigin" class="create-text">Cuisine Type</sf:label>
			<sf:input path="placeOfOrigin" class="create-text-input" onfocusout="validate('placeOfOrigin')" pattern="[a-zA-Z ]*" maxlength="255" required="required" title="Please use alphabetical characters."/><br>
		
			<sf:label path="mealType" class="create-text">Meal Type</sf:label>
			<sf:select path="mealType" class="create-text-input">
			<sf:options items="${mealTypes}" itemValue="shortName" itemLabel="fullName"/>
			</sf:select><br>
		</div>
		
		<div class="cr4 crDis">
			<label for="isVegetarian" class="container">Vegetarian
			<input type="hidden" name="isVegetarian" value="0">
			<input type="checkbox" name="isVegetarian" id="isVegetarian" value="true" class="create-check-input"/><span class="checkmark"></span></label><br>
			
			<label for="isGlutenFree" class="container">Gluten Free
			<input type="hidden" name="isGlutenFree" value="0">
			<input type="checkbox" name="isGlutenFree" id="isGlutenFree" value="true" class="create-check-input"/><span class="checkmark"></span></label><br>
			
			<label for="isPeanutFree" class="container">Peanut Free
			<input type="hidden" name="isPeanutFree" value="0">
			<input type="checkbox" name="isPeanutFree" id="isPeanutFree" value="true" class="create-check-input"/><span class="checkmark"></span></label><br>
			
			<label for="isVegan" class="container">Vegan
			<input type="hidden" name="isVegan" value="0">
			<input type="checkbox" name="isVegan" id="isVegan" value="true" class="create-check-input"/><span class="checkmark"></span></label><br>
			
			<label for="isLactoseFree" class="container">Lactose Free
			<input type="hidden" name="isLactoseFree" value="0">
			<input type="checkbox" name="isLactoseFree" id="isLactoseFree" value="true" class="create-check-input"/><span class="checkmark"></span></label><br>
		</div>
		
		<div class="cr6 crDis">
			<div  class="create-text">Select image(s) to upload :
				<div class="image-upload"">
				  <label for="file">
				    <img class="camera-image"  src=<spring:url value="/resources/images/photo-camera.png"/>/>
				    <!-- <!--  <input type="file" class="camera-image" multiple="multiple"/>   --> 
				  </label>
				  <p id="imageUploadedMessage">  </p>
				  <input style="display: none;" type="file" accept="image/jpeg, image/png, image/jpg" name="file" id="file" multiple/>
				</div>
			</div>
		</div>
				
		<div class="cr2">
			<div class="cr2left">
				<div class="plus-button-resizer">
					<label  class="create-text">Ingredients (First Ingredient Required)</label>
				</div>
				<table id="ingredients" class="create-table">
				<tr>
				<td><input name="ingredient-name" id="ingredient-name" onfocusout="validate('ingredient-name')" class="create-text-input-table" placeholder="Ingredient Name (Letters Only)" pattern="[a-zA-Z ]*" maxlength="255" required="required" title="Please use alphabetical characters."></input>   </td>
				<td><input name="ingredient-quantity" id="ingredient-quantity" onfocusout="validate('ingredient-quantity')" class="create-text-input-table" placeholder="Quantity (0-255)" maxlength="6" pattern="^([01]?[0-9]?[0-9]\.?[0-9]{0,2}|2[0-4][0-9]\.?[0-9]{0,2}|25[0-5]\.?[0-9]{0,2})$" required="required" title="0-255"></input></td>
				<td><select name="ingredient-unit" class="create-text-input-table">
					<option value="lb">Pound (lb)</option>
					<option value="kg">Kilogram (kg)</option>
					<option value="g">Gram (g)</option>
					<option value="oz">Ounce (oz)</option>
					<option value="pcs">Pieces (pcs)</option>
				</select></td>
				</tr>
				</table>
				<input type="image" src=<spring:url value="/resources/images/MinusButton.png"/> class="plus-button" onclick="removeIngredientRow();return false;"></input>
				<input type="image" src=<spring:url value="/resources/images/PlusButton.png"/> class="plus-button" onclick="replicateIngredientRows();return false;"></input>
			</div>
			
			<div class="cr2right">
				<!-- There should be a dynamically (ideally) resizable amount of text boxes that correlates to the number of steps that you create -->
				<div class="plus-button-resizer">
					<label  class="create-text">Steps</label>
				</div>
				<table id="steps" class="create-table">
				<tr>
					<td><sf:label class="stepsText" path="steps"><div class="create-text">Step 1: </div></sf:label><sf:textarea path="steps" class="create-text-input-table" maxlength="255" placeholder="No more than 255 characters per step"/><br></td>
				</tr>
				</table>
				<input type="image" src=<spring:url value="/resources/images/MinusButton.png"/> class="plus-button" onclick="removeStepRow();return false;"></input>
				<input type="image" src=<spring:url value="/resources/images/PlusButton.png"/> class="plus-button" onclick="replicateStepRows();return false;"></input>
			</div>
		</div>
		
		<div class="cr5">
			<sf:label path="specialInstructions" class="create-text">Special Instructions</sf:label>
			<sf:input path="specialInstructions" class="create-text-input" onfocusout="validate('specialInstructions')" pattern="[0-9a-zA-Z,.;\/'\"()!%\-$+=[]{} ]*" maxlength="255" title="Please use alphanumeric characters."/><br>
			
			<sf:label path="videoLink" class="create-text">Video Link</sf:label>
			<sf:input path="videoLink" class="create-text-input" onfocusout="validate('videoLink')" placeholder="Youtube links only" pattern="^((https?):\/\/)?(www.)?youtube+\.com+(\/[a-zA-Z0-9#?=_]+\/?)*$" maxlength="255" title="Please enter a valid Youtube link"/><br>
			<!-- Any url: ^((https?|ftp|smtp):\/\/)?(www.)?[a-z0-9]+\.[a-z]+(\/[a-zA-Z0-9#?=_]+\/?)*$ -->
			
			<input type="submit" value="Create Recipe" class="create-recipe-button"/>
		</div>
		<br>		
		
	</sf:form>
</div>
</body>

<%@ include file="/WEB-INF/views/footer.jsp" %>

<script src=<spring:url value="/resources/js/savourTheFlavour.js"/> type="text/javascript"></script>
</html>