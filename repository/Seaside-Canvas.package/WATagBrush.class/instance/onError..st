attributes-events
onError: anObject
	"Fired when unexpected errors occur (e.g. networking errors, script errors, decoding errors)."

	self document scriptGenerator
		event: 'error'
		do: anObject
		on: self