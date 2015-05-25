attributes-events
onMouseOut: anObject
	"The onmouseout event occurs when the pointing device is moved away from an element."

	self document scriptGenerator
		event: 'mouseout'
		do: anObject
		on: self