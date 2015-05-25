attributes-events
onSelect: anObject
	"The onselect event occurs when a user selects some text in a text field."

	self document scriptGenerator
		event: 'select'
		do: anObject
		on: self