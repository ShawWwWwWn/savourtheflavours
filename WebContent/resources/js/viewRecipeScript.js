/**
 * 
 */

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
