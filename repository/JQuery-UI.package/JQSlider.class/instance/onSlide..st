events-generated
onSlide: anObject
	"This event is triggered on every mouse move during slide. Use ui.value (single-handled sliders) to obtain the value of the current handle, $(..).slider('value', index) to get another handles' value. Return false in order to prevent a slide, based on ui.value."

	self optionAt: 'slide' put: anObject asFunction