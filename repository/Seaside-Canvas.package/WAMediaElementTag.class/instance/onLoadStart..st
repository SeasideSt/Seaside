attributes-events
onLoadStart: anObject
	"The user agent begins looking for media data, as part of the resource selection algorithm."

	self document scriptGenerator
		event: 'loadstart'
		do: anObject
		on: self