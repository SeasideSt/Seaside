events
onChange: anObject
	"Called whenever the Slider has finished moving or has had its value changed. The called function gets the slider value as its parameter."

	self optionAt: 'onChange' put: anObject asFunction