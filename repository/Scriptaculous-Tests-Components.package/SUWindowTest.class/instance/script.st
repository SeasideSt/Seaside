hooks
script
	^ 'Object.extend(Position, {
	windowBounds: function() {
		var x = window.innerWidth
			|| document.documentElement.clientWidth
			|| document.body.clientWidth
			|| 0;
		var y = window.innerHeight
			|| document.documentElement.clientHeight
			|| document.body.clientHeight
			|| 0;
		return [x, y];
	}
});
Object.extend(Element, {
	fullscreen: function(element) {
		element = $(element);
		element.show();
		element.style.position = "absolute";
		element.style.left = element.style.top = 0;
		element.style.width = "100%";
		element.style.height = "5000px";
	},
	center: function(element) {
		element = $(element);
		var extent = Element.getDimensions(element);
		var bounds = Position.windowBounds();
		var x = (bounds[0] - extent.width) / 2;
		var y = (bounds[1] - extent.height) / 2;
		x = x < 0 ? 0 : x; y = y < 0 ? 0 : y;
		element.style.position = "absolute";
		element.style.left = x + "px";
		element.style.top = y + "px";
	}
});'