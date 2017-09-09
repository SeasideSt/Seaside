attributes-events
onStalled: anObject
	"The user agent is trying to fetch media data, but data is unexpectedly not forthcoming."

	self document scriptGenerator
		event: 'stalled'
		do: anObject
		on: self