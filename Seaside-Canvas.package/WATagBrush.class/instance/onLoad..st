attributes-events
onLoad: anObject
	"The onload event occurs when the user agent finishes loading a window."

	self document scriptGenerator
		event: 'load'
		do: anObject
		on: self