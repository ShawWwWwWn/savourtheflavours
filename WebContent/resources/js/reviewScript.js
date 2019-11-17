/**
 * 
 */
function noStars(){
	document.getElementById('star1').className='fa fa-star ';
	document.getElementById('star2').className='fa fa-star ';
	document.getElementById('star3').className='fa fa-star ';
	document.getElementById('star4').className='fa fa-star ';
	document.getElementById('star5').className='fa fa-star ';
}

function oneStar(){
	document.getElementById('star1').className='fa fa-star checkedStar';
}

function twoStars(){
	document.getElementById('star1').className='fa fa-star checkedStar';
	document.getElementById('star2').className='fa fa-star checkedStar';
}

function threeStars(){
	document.getElementById('star1').className='fa fa-star checkedStar';
	document.getElementById('star2').className='fa fa-star checkedStar';
	document.getElementById('star3').className='fa fa-star checkedStar';
}

function fourStars(){
	document.getElementById('star1').className='fa fa-star checkedStar';
	document.getElementById('star2').className='fa fa-star checkedStar';
	document.getElementById('star3').className='fa fa-star checkedStar';
	document.getElementById('star4').className='fa fa-star checkedStar';
}

function fiveStars(){
	document.getElementById('star1').className='fa fa-star checkedStar';
	document.getElementById('star2').className='fa fa-star checkedStar';
	document.getElementById('star3').className='fa fa-star checkedStar';
	document.getElementById('star4').className='fa fa-star checkedStar';
	document.getElementById('star5').className='fa fa-star checkedStar';
}

function oneStarSelected(){
	document.getElementById('star1').className='fa fa-star checkedStar';
	
	document.getElementById('star1').id = 'star1Clicked';
	document.getElementById('star2').id = 'star2Clicked';
	document.getElementById('star3').id = 'star3Clicked';
	document.getElementById('star4').id = 'star4Clicked';
	document.getElementById('star5').id = 'star5Clicked';
	
	var rating = document.getElementById("reviewStars");
	rating.setAttribute("value", "1");
}

function twoStarsSelected(){
	document.getElementById('star1').className='fa fa-star checkedStar';
	document.getElementById('star2').className='fa fa-star checkedStar';
	
	document.getElementById('star1').id = 'star1Clicked';
	document.getElementById('star2').id = 'star2Clicked';
	document.getElementById('star3').id = 'star3Clicked';
	document.getElementById('star4').id = 'star4Clicked';
	document.getElementById('star5').id = 'star5Clicked';
	
	document.getElementById("reviewStars").value = "2";
}

function threeStarsSelected(){
	document.getElementById('star1').className='fa fa-star checkedStar';
	document.getElementById('star2').className='fa fa-star checkedStar';
	document.getElementById('star3').className='fa fa-star checkedStar';
	
	document.getElementById('star1').id = 'star1Clicked';
	document.getElementById('star2').id = 'star2Clicked';
	document.getElementById('star3').id = 'star3Clicked';
	document.getElementById('star4').id = 'star4Clicked';
	document.getElementById('star5').id = 'star5Clicked';
	
	document.getElementById("reviewStars").value = "3";
}

function fourStarsSelected(){
	document.getElementById('star1').className='fa fa-star checkedStar';
	document.getElementById('star2').className='fa fa-star checkedStar';
	document.getElementById('star3').className='fa fa-star checkedStar';
	document.getElementById('star4').className='fa fa-star checkedStar';
	
	document.getElementById('star1').id = 'star1Clicked';
	document.getElementById('star2').id = 'star2Clicked';
	document.getElementById('star3').id = 'star3Clicked';
	document.getElementById('star4').id = 'star4Clicked';
	document.getElementById('star5').id = 'star5Clicked';
	
	document.getElementById("reviewStars").value = "4";
}

function fiveStarsSelected(){
	document.getElementById('star1').className='fa fa-star checkedStar';
	document.getElementById('star2').className='fa fa-star checkedStar';
	document.getElementById('star3').className='fa fa-star checkedStar';
	document.getElementById('star4').className='fa fa-star checkedStar';
	document.getElementById('star5').className='fa fa-star checkedStar';
	
	document.getElementById('star1').id = 'star1Clicked';
	document.getElementById('star2').id = 'star2Clicked';
	document.getElementById('star3').id = 'star3Clicked';
	document.getElementById('star4').id = 'star4Clicked';
	document.getElementById('star5').id = 'star5Clicked';
	
	document.getElementById("reviewStars").value = "5";
}

function favoritFunction(){
	var defpic = document.getElementById('emptyHeart');
	var newpic = document.getElementById('filledHeart');
	defpic.setAttribute("src", "/SavourTheFlavours/resources/images/favorite-clicked.png");
	defpic.setAttribute("href", "/unfavourited/${recipe.recipeId}");
	
	newpic.setAttribute("src", "/SavourTheFlavours/resources/images/favorite.png");
	newpic.setAttribute("href", "/favourited/${recipe.recipeId}");

}