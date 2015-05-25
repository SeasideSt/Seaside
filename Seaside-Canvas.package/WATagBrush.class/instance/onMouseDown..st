attributes-events
onMouseDown: anObject
	"The onmousedown event occurs when the pointing device button is pressed over an element."

	self document scriptGenerator
		event: 'mousedown'
		do: anObject
		on: self