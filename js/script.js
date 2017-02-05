/****** GLOBAL ******/
var currentColor = "white";
var svgns = "http://www.w3.org/2000/svg";
var sizeX = 8;
var sizeY = 8;
var svgElement = document.getElementById("svgID");
var groupMap;
var arrayLines = [];
var arrayColumn = [];
var arrayCell = [];


/****** FUNCTION ******/


var createMap = function (){
	groupMap = document.createElementNS(svgns,"g");
	groupMap.setAttribute("id", "mapID");
	groupMap.setAttribute("transform", "translate(0,0)")
	svgElement.appendChild(groupMap);

	for(var i = 0 ; i < sizeY ; i++){
		for(var j = 0 ; j < sizeX ; j++){
			var currentCell = createCell(j, i);
			arrayLines.push(currentCell);
			if(i === 3 && j ===3){
				var groupChild = currentCell.children;
				groupChild[1].setAttribute("fill", "white");
			} else if(i === 3 && j ===4){
				var groupChild = currentCell.children;
				groupChild[1].setAttribute("fill", "black");
			} else if(i === 4 && j ===3){
				var groupChild = currentCell.children;
				groupChild[1].setAttribute("fill", "black");
			} else if(i === 4 && j ===4){
				var groupChild = currentCell.children;
				groupChild[1].setAttribute("fill", "white");
			}
		}
		arrayCell.push(arrayLines);
		arrayLines = [];
	}
};


var createCell = function(x, y) {
	var groupCell = document.createElementNS(svgns,"g");
	var rectCell = document.createElementNS(svgns,"rect");
	var circleCell = document.createElementNS(svgns,"circle");

	groupCell.setAttribute("transform", "translate("+(x*50)+","+(y*50)+")")

	rectCell.setAttribute("width", 50);
	rectCell.setAttribute("height", 50);
	rectCell.setAttribute("fill", "green");
	rectCell.setAttribute("stroke", "black");
	rectCell.setAttribute("stroke-width", "0.5");

	circleCell.setAttribute("cx", 25);
	circleCell.setAttribute("cy", 25);
	circleCell.setAttribute("r", 20);
	circleCell.setAttribute("fill", "none");

	groupCell.appendChild(rectCell);
	groupCell.appendChild(circleCell);
	groupMap.appendChild(groupCell);

	groupCell.addEventListener("click", function(){
		var result = isClickable(this, x ,y);
		console.log(currentColor);
		if(result === true){			
			circleCell.setAttribute("fill", currentColor);
			setCurrentColor();
		}

			
	}, false);

	return groupCell;
};

var game = function(cell){

}

var isClickable = function(cell, x ,y){
	var value = checkCellValue(cell);
	var result = false;
	var currentArrayLeft = [];
	var currentArrayRight = [];
	var currentArrayBottom = [];
	var currentArrayTop = [];

	var currentArrayTopLeft = [];
	var currentArrayTopRight = [];
	var currentArrayBottomLeft = [];
	var currentArrayBottomRight = [];

	if(value === "empty"){
		var cellLeft;
		var cellRight;
		var cellBottom;
		var cellTop;

		var cellTopLeft;
		var cellBottomLeft;		
		var cellTopRight;
		var cellBottomRight;


		if((x-1) >= 0){			
			cellLeft = getCellInArray((x-1), y);
		} else {
			cellLeft = null;
		}

		if((x+1) < 8){			
			cellRight = getCellInArray((x+1), y);
		} else {
			cellRight = null;
		}

		if((y-1) >= 0){			
			cellTop = getCellInArray(x, (y - 1));
		} else {
			cellTop = null;
		}

		if((y+1) < 8){			
			cellBottom = getCellInArray(x, (y + 1));
		} else {
			cellBottom = null;
		}


		if((x-1) > 0 && (y-1) >= 0){			
			cellTopLeft = getCellInArray((x-1), (y-1));
		} else {
			cellTopLeft = null;
		}

		if((x-1) > 0 && (y+1) < 8){			
			cellBottomLeft = getCellInArray((x-1), (y+1));
		} else {
			cellBottomLeft = null;
		}

		if((x+1) < 8 && (y-1) >= 0){			
			cellTopRight = getCellInArray((x+1), (y-1));
		} else {
			cellTopRight = null;
		}

		if((x+1) < 8 && (y+1) < 8){			
			cellBottomRight = getCellInArray((x+1), (y+1));
		} else {
			cellBottomRight = null;
		}

		if(currentColor === "white"){
			
			if(getCellColor(cellLeft) === "black"){

				for(var i = (x-1) ; i >= 0; i--){
					var _cell = getCellInArray(i, y);
					if(getCellColor(_cell) === "black"){
						currentArrayLeft.push(_cell);
					} else if(getCellColor(_cell) === "white"){						
						for(var p = 0 ; p < currentArrayLeft.length ; p++){
							currentArrayLeft[p].children[1].setAttribute("fill", "white");
						}
						result = true;
						break;												
					} else if(getCellColor(_cell) === "empty"){
						break;
					}
				}

			} 

			if(getCellColor(cellRight) === "black") {

				for(var i = (x+1) ; i < 8; i++){
					var _cell = getCellInArray(i, y);
					if(getCellColor(_cell) === "black"){
						currentArrayRight.push(_cell);
					} else if(getCellColor(_cell) === "white"){						
						for(var p = 0 ; p < currentArrayRight.length ; p++){
							currentArrayRight[p].children[1].setAttribute("fill", "white");
						}
						result = true;
						break;												
					} else if(getCellColor(_cell) === "empty"){
						break;
					}
				}

			}	

			if(getCellColor(cellBottom) === "black"){

				for(var i = (y+1) ; i < 8; i++){
					var _cell = getCellInArray(x, i);
					if(getCellColor(_cell) === "black"){
						currentArrayBottom.push(_cell);
					} else if(getCellColor(_cell) === "white"){						
						for(var p = 0 ; p < currentArrayBottom.length ; p++){
							currentArrayBottom[p].children[1].setAttribute("fill", "white");
						}
						result = true;
						break;												
					} else if(getCellColor(_cell) === "empty"){
						break;
					}
				}

			} 

			if(getCellColor(cellTop) === "black"){

				for(var i = (y-1) ; i >= 0; i--){
					var _cell = getCellInArray(x, i);
					if(getCellColor(_cell) === "black"){
						currentArrayBottom.push(_cell);
					} else if(getCellColor(_cell) === "white"){						
						for(var p = 0 ; p < currentArrayBottom.length ; p++){
							currentArrayBottom[p].children[1].setAttribute("fill", "white");
						}
						result = true;
						break;												
					} else if(getCellColor(_cell) === "empty"){
						break;
					}
				}

			} 

			if(getCellColor(cellTopLeft) === "black"){
			
				for(var i = (y-1), j = (x-1) ; i >= 0 && j >=0; i--, j--){
					var _cell = getCellInArray(j, i);
		
					if(getCellColor(_cell) === "black"){
						currentArrayTopLeft.push(_cell);
					} else if(getCellColor(_cell) === "white"){						
						for(var p = 0 ; p < currentArrayTopLeft.length ; p++){
							currentArrayTopLeft[p].children[1].setAttribute("fill", "white");
						}
						result = true;
						break;												
					} else if(getCellColor(_cell) === "empty"){
						break;
					}		
				}

			} 

			if(getCellColor(cellBottomLeft) === "black"){

				for(var i = (y+1), j = (x-1) ; i < 8 && j >= 0; i++, j--){
					var _cell = getCellInArray(j, i);
		
					if(getCellColor(_cell) === "black"){
						currentArrayBottomLeft.push(_cell);
					} else if(getCellColor(_cell) === "white"){						
						for(var p = 0 ; p < currentArrayBottomLeft.length ; p++){
							currentArrayBottomLeft[p].children[1].setAttribute("fill", "white");
						}
						result = true;
						break;												
					} else if(getCellColor(_cell) === "empty"){
						break;
					}			
				}

			} 

			if(getCellColor(cellTopRight) === "black"){

				for(var i = (y-1), j = (x+1) ; i >= 0 && j < 8; i--, j++){
					var _cell = getCellInArray(j, i);
		
					if(getCellColor(_cell) === "black"){
						currentArrayTopRight.push(_cell);
					} else if(getCellColor(_cell) === "white"){						
						for(var p = 0 ; p < currentArrayTopRight.length ; p++){
							currentArrayTopRight[p].children[1].setAttribute("fill", "white");
						}
						result = true;
						break;												
					} else if(getCellColor(_cell) === "empty"){
						break;
					}			
				}

			} 

			if(getCellColor(cellBottomRight) === "black"){

				for(var i = (y+1), j = (x+1) ; i < 8 && j < 8; i++, j++){
					var _cell = getCellInArray(j, i);
		
					if(getCellColor(_cell) === "black"){
						currentArrayBottomRight.push(_cell);
					} else if(getCellColor(_cell) === "white"){						
						for(var p = 0 ; p < currentArrayBottomRight.length ; p++){
							currentArrayBottomRight[p].children[1].setAttribute("fill", "white");
						}
						result = true;
						break;												
					} else if(getCellColor(_cell) === "empty"){
						break;
					}			
				}

			}

		} else if(currentColor === "black"){



			if(getCellColor(cellLeft) === "white"){

				for(var i = (x-1) ; i >= 0; i--){
					var _cell = getCellInArray(i, y);
					if(getCellColor(_cell) === "white"){
						currentArrayLeft.push(_cell);
					} else if(getCellColor(_cell) === "black"){						
						for(var p = 0 ; p < currentArrayLeft.length ; p++){
							currentArrayLeft[p].children[1].setAttribute("fill", "black");
						}
						result = true;
						break;												
					} else if(getCellColor(_cell) === "empty"){
						break;
					}
				}

			} 

			if(getCellColor(cellRight) === "white") {

				for(var i = (x+1) ; i < 8; i++){
					var _cell = getCellInArray(i, y);
					if(getCellColor(_cell) === "white"){
						currentArrayRight.push(_cell);
					} else if(getCellColor(_cell) === "black"){						
						for(var p = 0 ; p < currentArrayRight.length ; p++){
							currentArrayRight[p].children[1].setAttribute("fill", "black");
						}
						result = true;
						break;												
					} else if(getCellColor(_cell) === "empty"){
						break;
					}
				}

			}	

			if(getCellColor(cellBottom) === "white"){

				for(var i = (y+1) ; i < 8; i++){
					var _cell = getCellInArray(x, i);
					if(getCellColor(_cell) === "white"){
						currentArrayBottom.push(_cell);
					} else if(getCellColor(_cell) === "black"){						
						for(var p = 0 ; p < currentArrayBottom.length ; p++){
							currentArrayBottom[p].children[1].setAttribute("fill", "black");
						}
						result = true;
						break;												
					} else if(getCellColor(_cell) === "empty"){
						break;
					}
				}

			} 

		  if(getCellColor(cellTop) === "white"){

				for(var i = (y-1) ; i >= 0; i--){
					var _cell = getCellInArray(x, i);
					if(getCellColor(_cell) === "white"){
						currentArrayBottom.push(_cell);
					} else if(getCellColor(_cell) === "black"){						
						for(var p = 0 ; p < currentArrayBottom.length ; p++){
							currentArrayBottom[p].children[1].setAttribute("fill", "black");
						}
						result = true;
						break;												
					} else if(getCellColor(_cell) === "empty"){
						break;
					}
				}
			} 

			if(getCellColor(cellTopLeft) === "white"){
			
				for(var i = (y-1), j = (x-1) ; i >= 0 && j >=0; i--, j--){
					var _cell = getCellInArray(j, i);
		
					if(getCellColor(_cell) === "white"){
						currentArrayTopLeft.push(_cell);
					} else if(getCellColor(_cell) === "black"){						
						for(var p = 0 ; p < currentArrayTopLeft.length ; p++){
							currentArrayTopLeft[p].children[1].setAttribute("fill", "black");
						}
						result = true;
						break;												
					} else if(getCellColor(_cell) === "empty"){
						break;
					}		
				}
			} 

			if(getCellColor(cellBottomLeft) === "white"){

				for(var i = (y+1), j = (x-1) ; i < 8 && j >= 0; i++, j--){
					var _cell = getCellInArray(j, i);
		
					if(getCellColor(_cell) === "white"){
						currentArrayBottomLeft.push(_cell);
					} else if(getCellColor(_cell) === "black"){						
						for(var p = 0 ; p < currentArrayBottomLeft.length ; p++){
							currentArrayBottomLeft[p].children[1].setAttribute("fill", "black");
						}
						result = true;
						break;												
					} else if(getCellColor(_cell) === "empty"){
						break;
					}			
				}

			} 

			if(getCellColor(cellTopRight) === "white"){

				for(var i = (y-1), j = (x+1) ; i >= 0 && j < 8; i--, j++){
					var _cell = getCellInArray(j, i);
		
					if(getCellColor(_cell) === "white"){
						currentArrayTopRight.push(_cell);
					} else if(getCellColor(_cell) === "black"){						
						for(var p = 0 ; p < currentArrayTopRight.length ; p++){
							currentArrayTopRight[p].children[1].setAttribute("fill", "black");
						}
						result = true;
						break;												
					} else if(getCellColor(_cell) === "empty"){
						break;
					}			
				}

			} 

			if(getCellColor(cellBottomRight) === "white"){

				for(var i = (y+1), j = (x+1) ; i < 8 && j < 8; i++, j++){
					var _cell = getCellInArray(j, i);
		
					if(getCellColor(_cell) === "white"){
						currentArrayBottomRight.push(_cell);
					} else if(getCellColor(_cell) === "black"){						
						for(var p = 0 ; p < currentArrayBottomRight.length ; p++){
							currentArrayBottomRight[p].children[1].setAttribute("fill", "black");
						}
						result = true;
						break;												
					} else if(getCellColor(_cell) === "empty"){
						break;
					}			
				}
			}
		}	

		return result;
	}

};

var getCellInArray = function(x, y){
	return arrayCell[y][x];
}

var getCellColor = function(cell){
	if(cell !== null){
		var result = cell.children[1].getAttribute("fill");
		if(result === "none")
			result = "empty";

		return result;
	}	
}

var setCurrentColor = function(){
	if(currentColor === "white"){		
		currentColor = "black";
	} else if(currentColor === "black"){
		currentColor = "white";
	}
};

var getCell = function(cell) {
	return cell;
};

var checkCellValue = function(cell) {
	var circle = cell.children[1];
	if(circle.getAttribute("fill") === "white"){
		return "white";
	} else if(circle.getAttribute("fill") === "black"){
		return "black";
	} else {
		return "empty";
	}
};

createMap();

