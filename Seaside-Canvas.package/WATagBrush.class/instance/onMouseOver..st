attributes-events
onMouseOver: anObject
	"The onmouseover event occurs when the pointing device is moved onto an element."

	self document scriptGenerator
		event: 'mouseover'
		do: anObject
		on: self