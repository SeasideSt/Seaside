attributes-events
onKeyPress: anObject
	"The onkeypress event occurs when a key is pressed and released over an element."

	self document scriptGenerator
		event: 'keypress'
		do: anObject
		on: self