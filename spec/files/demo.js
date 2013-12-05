//Create Graphpaper instance
var elt = document.getElementById("calculator");
var graph = Desmos.Graphpaper(elt);
var col = Desmos.Colors;

//Set the viewport to show only the first quadrant
function firstQuadrant() {
	graph.setViewport([-5, 100, -5, 100]);
};
firstQuadrant();

//Resize the graphpaper when the browser is resized
var updateScreen = function() {
	graph.resize();
	firstQuadrant();
};
window.addEventListener("resize", updateScreen, false);

//Expressions to be graphed
var expressions = [
	{id: "youngest", latex: "y=(1/2)x+7 \\{x>=0\\}", color: col.GREEN, hidden: true},
	{id: "youngestRegion", latex: "y>=(1/2)x+7 \\{x>=0\\}", color: col.GREEN, hidden: true},
	{id: "oldest", latex: "y=2(x-7) \\{x>=0\\}", color: col.RED, hidden: true},
	{id: "oldestRegion", latex: "y<=2(x-7) \\{x>=0\\}", color: col.RED, hidden: true},
	{id: "roco", latex: "(1/2)x+7<=y<=2(x-7) \\{x>=0\\}", color: col.BLUE, hidden: true}
];

//Graph all the expressions
function plot() {
	graph.setExpressions(expressions);
}
plot();

//Hide all expressions
function hideAll() {
	for (var i=0; i<expressions.length; i++) {
		expressions[i].hidden = true;
	}
	plot();
}

//Show an individual expression (takes an integer with expression's index)
function show(exp_index) {
	expressions[exp_index].hidden = false;
	plot();
}

//Tie graph updates to buttons
var q1 = $("#q1");
var q2 = $("#q2");
var q3 = $("#q3");
var q4 = $("#q4");
var q5 = $("#q5");
var q6 = $("#q6");

q1.click(function() {
	firstQuadrant();
	hideAll();
});

q2.click(function() {
	firstQuadrant();
	hideAll();
	show(0);
});

q3.click(function() {
	firstQuadrant();
	hideAll();
	show(0);
	show(1);
});

q4.click(function() {
	firstQuadrant();
	hideAll();
	show(0);
	show(1);
	show(2);	
});

q5.click(function() {
	firstQuadrant();
	hideAll();
	show(0);
	show(1);
	show(2);
	show(3);
});

q6.click(function() {
	firstQuadrant();
	hideAll();
	show(4);
});
