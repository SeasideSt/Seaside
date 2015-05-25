attributes-events
onKeyUp: anObject
	"The onkeyup event occurs when a key is released over an element."

	self document scriptGenerator
		event: 'keyup'
		do: anObject
		on: self