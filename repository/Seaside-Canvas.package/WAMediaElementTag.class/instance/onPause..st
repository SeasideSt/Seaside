attributes-events
onPause: anObject
	"The element has been paused. Fired after the pause() method has returned."

	self document scriptGenerator
		event: 'pause'
		do: anObject
		on: self