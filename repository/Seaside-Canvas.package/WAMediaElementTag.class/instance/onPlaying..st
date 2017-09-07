attributes-events
onPlaying: anObject
	"Playback is ready to start after having been paused or delayed due to lack of media data."

	self document scriptGenerator
		event: 'playing'
		do: anObject
		on: self