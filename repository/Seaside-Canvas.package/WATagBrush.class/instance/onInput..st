attributes-events
onInput: anObject
	"Fired at controls when the user changes the value (see also the change event)."

	self document scriptGenerator
		event: 'input'
		do: anObject
		on: self