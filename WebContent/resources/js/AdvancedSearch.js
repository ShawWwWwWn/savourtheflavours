//var tbl = document.getElementById("recipesTbl");
		
		var vegetarian = document.getElementById("dietVegetarian");
		var vegan = document.getElementById("dietVegan");
		var peanut = document.getElementById("dietPeanut");
		var gluten = document.getElementById("dietGluten");
		var lactose = document.getElementById("dietLactose");
		var dietTbls;
		function dietSearch() {
			var tempString;
			
			dietTbls = document.getElementsByClassName("dietTbl");
			//iterate through tables
			for(var i = 0;i < dietTbls.length; i++) {
				
				//iterate through columns
				
				for(var j = 0; j < dietTbls[i].rows[0].cells.length; j++) {
					
					tempString = dietTbls[i].rows[0].cells[j].innerHTML;
					tempString = tempString.trim();     // trim() remmoves the empty spaces
					
					if(vegetarian.checked) {
						if(tempString == "No" && dietTbls[i].rows[0].cells[j].className == "vegetarian") {
							dietTbls[i].parentElement.style.display = "none";
							break;
						}
					} else {
						dietTbls[i].parentElement.style.display = "";
					}
					
					if(vegan.checked) {
						if(tempString == "No" && dietTbls[i].rows[0].cells[j].className == "vegan") {
							dietTbls[i].parentElement.style.display = "none";
							break;
						}
					} else {
						dietTbls[i].parentElement.style.display = "";
					}
					
					if(gluten.checked) {
						if(tempString == "Yes" && dietTbls[i].rows[0].cells[j].className == "gluten") {
							dietTbls[i].parentElement.style.display = "none";
							break;
						}
					} else {
						dietTbls[i].parentElement.style.display = "";
					}
					if(peanut.checked) {
						if(tempString == "Yes" && dietTbls[i].rows[0].cells[j].className == "peanut") {
							dietTbls[i].parentElement.style.display = "none";
							break;
						}
					} else {
						dietTbls[i].parentElement.style.display = "";
					}
					if(lactose.checked) {
						if(tempString == "Yes" && dietTbls[i].rows[0].cells[j].className == "lactose") {
							dietTbls[i].parentElement.style.display = "none";
							break;
						}
					} else {
						dietTbls[i].parentElement.style.display = "";
					}
					
				}
				
			}
			
			//Old code.
			//iterate through rows
/*			for(var i = 1; i < tbl.rows.length; i++) {
				
				//iterate through columns
				//for(var j = 0; j < tbl.rows[i].cells.length; j++) {
					
					if(vegetarian.checked) {
						tempString = tbl.rows[i].cells[2].innerHTML;
						tempString = tempString.trim();     // trim() remmoves the empty spaces
						if(tempString == "No") {
							tbl.rows[i].style.display = "none";
							continue;
						}
					} else {
						tbl.rows[i].style.display = "";
					}
					
					if(vegan.checked) {
						tempString = tbl.rows[i].cells[3].innerHTML;
						tempString = tempString.trim();
						if(tempString == "No") {
							tbl.rows[i].style.display = "none";
							continue;
						}
					} else {
						tbl.rows[i].style.display = "";
					}
					
					if(gluten.checked) {
						tempString = tbl.rows[i].cells[4].innerHTML;
						tempString = tempString.trim();
						if(tempString == "Yes") {
							tbl.rows[i].style.display = "none";
							continue;
						}
					} else {
						tbl.rows[i].style.display = "";
					}
					if(peanut.checked) {
						tempString = tbl.rows[i].cells[5].innerHTML;
						tempString = tempString.trim();
						if(tempString == "Yes") {
							tbl.rows[i].style.display = "none";
							continue;
						}
					} else {
						tbl.rows[i].style.display = "";
					}
					if(lactose.checked) {
						tempString = tbl.rows[i].cells[6].innerHTML;
						tempString = tempString.trim();
						if(tempString == "Yes") {
							tbl.rows[i].style.display = "none";
							continue;
						}
					} else {
						tbl.rows[i].style.display = "";
					}
					
				//}
				
			}*/
		}
		