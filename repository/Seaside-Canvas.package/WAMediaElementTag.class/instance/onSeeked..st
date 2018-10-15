attributes-events
onSeeked: anObject
	"The seeking IDL attribute changed to false after the current playback position was changed."

	self document scriptGenerator
		event: 'seeked'
		do: anObject
		on: self