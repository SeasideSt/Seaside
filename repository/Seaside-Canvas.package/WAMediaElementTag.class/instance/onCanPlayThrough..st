attributes-events
onCanPlayThrough: anObject
	"The user agent estimates that if playback were to be started now, the media resource could be rendered at the current playback rate all the way to its end without having to stop for further buffering."

	self document scriptGenerator
		event: 'canplaythrough'
		do: anObject
		on: self