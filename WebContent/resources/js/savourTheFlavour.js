/**
 * 
 */
var counter=1;
function replicateIngredientRows(){
	
	var table = document.getElementById("ingredients");
	
	var currentRows=table.rows.length;
	
	  var row = table.insertRow(currentRows);
	  var cell1 = row.insertCell(0);
	  var cell2 = row.insertCell(1);
	  var cell3 = row.insertCell(2);
	  cell1.innerHTML = '<input name="ingredient-name" class="create-text-input-table" placeholder="Ingredient Name (Letters Only)" pattern="[a-zA-Z ]*" maxlength="255"></input> ';
	  cell2.innerHTML = '<input name="ingredient-quantity" class="create-text-input-table" placeholder="Quantity (0-255)" maxlength="6" pattern="^([01]?[0-9]?[0-9]\.?[0-9]{0,2}|2[0-4][0-9]\.?[0-9]{0,2}|25[0-5]\.?[0-9]{0,2})$"></input>';
	  cell3.innerHTML = '<select name="ingredient-unit" class="create-text-input-table"><option value="lb">Pound (lb)</option><option value="kg">Kilogram (kg)</option><option value="g">Gram (g)</option><option value="oz">Ounce (oz)</option></select>';
	
	
}

function removeIngredientRow(){
	
	var table = document.getElementById("ingredients");
	
	var currentRows=table.rows.length;
	if(currentRows != 1) {
		table.deleteRow(currentRows-1);
	}
		
}

function replicateStepRows(){
	counter++;
	var table = document.getElementById("steps");
	
	var currentRows=table.rows.length;
	
	  var row = table.insertRow(currentRows);
	  var cell1 = row.insertCell(0);
	  cell1.innerHTML = '<label for="steps" class="create-text">Step ' + counter + ': </label><br><textarea id="steps" name="steps" class="create-text-input-table" maxlength="255" placeholder="No more than 255 characters per step" value="">';
	
}

function removeStepRow(){
	
	var table = document.getElementById("steps");
	
	var currentRows=table.rows.length;
	if(currentRows != 1) {
		table.deleteRow(currentRows-1);
		counter--;
	}
		
}

function replicateImageUpload(){
	var table = document.getElementById("images");
	
	var currentRows=table.rows.length;
	
	  var row = table.insertRow(currentRows);
	  var cell1 = row.insertCell(0);
	  cell1.innerHTML = 'Select a file to upload <input type="file" name="image" />';
	
}

function myFunction() {
	  var x = document.getElementById("US-Dry-Volume-Measurements");
	  if (x.style.display === "none") {
	    x.style.display = "block";
	  } else if(x.style.display === "block"){
	    x.style.display = "none";
	  }

	}



function validate(idName) {
	  let form = document.getElementById(idName);

	  form.reportValidity();
}

function displayReviews(reviews,comments){
	 alert(comments);
}

function showReviewMessage(list){
	if(list.length==0 ){
		$("#noReviews").css("display","block");
	}
	else{
		$("#noReviews").css("display","none");
	}
}

function updateProfileMessage(message){
	if(message=="1"){
		$("#successMessage").css("display","block");
		$("#updateProfilePassword").val("");
		$("#updateProfileConfirmPassword").val("");
		
	}
	else{
		$("#successMessage").css("display","none");
		$("#updateProfilePassword").val("");
		$("#updateProfileConfirmPassword").val("");
	}
}
	
function showUserRecipeMessage(list){
	if(list.length==0 ){
		$("#noRecipes").css("display","block");
	}
	else{
		$("#noRecipes").css("display","none");
	}
}

function showFavouriteRecipeMessage(list){
	if(list.length==0 ){
		$("#noFavourites").css("display","block");
	}
	else{
		$("#noFavourites").css("display","none");
	}
}

/*function checkIfUpload(){
	
	if($("#file")!==null){
		alert("image uploaded");
		
	}
	
}*/


const $fileInput = document.getElementById('file')

$fileInput.addEventListener('change', function (event) {
  
	if($("#file")!==null){
		$('#imageUploadedMessage').html("");
		var noOfImages = $("#file").context.images.length;
		var message = "Image(s) selected"
		$('#imageUploadedMessage').append('<span>'+ message+ '</span>');
	}
	else{
		$('#imageUploadedMessage').html("");
		$("#imageUploadedMessage").css("display","none");
		fileInput.replaceWith(fileInput.val('').clone(true));
	}
  
  
}, false)




