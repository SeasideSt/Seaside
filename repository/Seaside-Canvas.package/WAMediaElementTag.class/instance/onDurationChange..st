attributes-events
onDurationChange: anObject
	"The duration attribute has just been updated."

	self document scriptGenerator
		event: 'durationchange'
		do: anObject
		on: self