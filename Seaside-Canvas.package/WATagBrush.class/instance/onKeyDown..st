attributes-events
onKeyDown: anObject
	"The onkeydown event occurs when a key is pressed down over an element."

	self document scriptGenerator
		event: 'keydown'
		do: anObject
		on: self