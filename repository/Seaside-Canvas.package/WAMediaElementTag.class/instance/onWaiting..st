attributes-events
onWaiting: anObject
	"Playback has stopped because the next frame is not available, but the user agent expects that frame to become available in due course."

	self document scriptGenerator
		event: 'waiting'
		do: anObject
		on: self