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
		var bounds = Position.windowBounds();
		element.style.position = "absolute";
		element.style.left = element.style.top = 0;
		element.style.width = bounds[0] + "px";
		element.style.height = bounds[1] + "px";
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
});
function updateLightbox() {//ie6 fix hide all select elements not inside the lightbox
	if (Prototype.Browser.IE) {if (navigator.userAgent.indexOf("MSIE 6") != -1) 
								{$$("select").invoke("setStyle", {visibility: "hidden"})
								$("lightbox").descendants().each(function(item) {item.setStyle({visibility: "visible"})})}};
	Element.fullscreen("overlay");
	Element.center("lightbox");
	Element.show("lightbox");
};'