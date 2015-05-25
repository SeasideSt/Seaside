attributes-events
onReset: anObject
	"The onreset event occurs when a form is reset."

	self document scriptGenerator
		event: 'reset'
		do: anObject
		on: self