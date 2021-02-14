Class {
	#name : #SULightbox,
	#superclass : #WADecoration,
	#instVars : [
		'delegate'
	],
	#category : 'Scriptaculous-Components-Core'
}

{ #category : #hooks }
SULightbox >> children [
	^ super children copyWith: self delegate
]

{ #category : #accessing }
SULightbox >> delegate [
	^ delegate
]

{ #category : #accessing }
SULightbox >> delegate: aComponent [
	delegate := aComponent
]

{ #category : #testing }
SULightbox >> isDelegation [
	^ true
]

{ #category : #'accessing-scripts' }
SULightbox >> lighter [
	^ JSStream on: 'updateLightbox();Event.observe(window,"resize",function(){updateLightbox();});'
]

{ #category : #rendering }
SULightbox >> renderContentOn: html [
	super renderContentOn: html.
	html div id: 'overlay'.
	html div
		id: 'lightbox';
		style: 'display: none';
		with: self delegate.
	html document addLoadScriptFirst: self lighter
]

{ #category : #hooks }
SULightbox >> script [
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
]

{ #category : #hooks }
SULightbox >> style [
	^ 'html { overflow: hidden; }
body { overflow: hidden; }
div#overlay {
	z-index: 9998;
	background-color: black;
	filter: alpha(opacity=40);
	-moz-opacity: 0.4;
	opacity: 0.4;
}
div#overlay[id] { position: fixed; }
div#lightbox { z-index: 9999; }'
]
