attributes-events
onEnded: anObject
	"Playback has stopped because the end of the media resource was reached."

	self document scriptGenerator
		event: 'ended'
		do: anObject
		on: self