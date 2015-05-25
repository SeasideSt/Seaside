attributes-events
onMouseUp: anObject
	"The onmouseup event occurs when the pointing device button is released over an element."

	self document scriptGenerator
		event: 'mouseup'
		do: anObject
		on: self