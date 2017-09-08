attributes-events
onSeeking: anObject
	"The seeking IDL attribute changed to true, and the user agent has started seeking to a new position."

	self document scriptGenerator
		event: 'seeking'
		do: anObject
		on: self