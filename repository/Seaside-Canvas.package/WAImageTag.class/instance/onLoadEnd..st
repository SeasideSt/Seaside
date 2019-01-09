attributes-events
onLoadEnd: anObject
	"Fired at img elements after a successful load."

	self document scriptGenerator
		event: 'loadend'
		do: anObject
		on: self