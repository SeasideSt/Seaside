events
onSlide: anObject
	"Called whenever the Slider is moved by dragging. The called function gets the slider value as its parameter."

	self optionAt: 'onSlide' put: anObject asFunction