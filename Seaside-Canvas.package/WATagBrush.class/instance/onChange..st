attributes-events
onChange: anObject
	"The onchange event occurs when a select input element has a selection made or when a text input element has a change in the text."

	self document scriptGenerator
		event: 'change'
		do: anObject
		on: self