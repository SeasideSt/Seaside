attributes-events
onCanPlay: anObject
	"The user agent can resume playback of the media data, but estimates that if playback were to be started now, the media resource could not be rendered at the current playback rate up to its end without having to stop for further buffering of content."

	self document scriptGenerator
		event: 'canplay'
		do: anObject
		on: self