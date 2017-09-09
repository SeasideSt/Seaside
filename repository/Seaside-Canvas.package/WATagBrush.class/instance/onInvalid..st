attributes-events
onInvalid: anObject
	"Fired at controls during form validation if they do not satisfy their constraints."

	self document scriptGenerator
		event: 'invalid'
		do: anObject
		on: self