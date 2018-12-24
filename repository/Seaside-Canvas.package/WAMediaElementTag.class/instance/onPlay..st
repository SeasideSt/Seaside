attributes-events
onPlay: anObject
	"The element is no longer paused. Fired after the play() method has returned, or when the autoplay attribute has caused playback to begin."

	self document scriptGenerator
		event: 'play'
		do: anObject
		on: self