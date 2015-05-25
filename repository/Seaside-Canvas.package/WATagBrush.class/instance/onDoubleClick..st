attributes-events
onDoubleClick: anObject
	"The ondblclick event occurs when the pointing device button is double clicked over an element."

	self document scriptGenerator
		event: 'dblclick'
		do: anObject
		on: self