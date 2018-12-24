attributes-events
onProgress: anObject
	"The user agent is fetching media data."

	self document scriptGenerator
		event: 'progress'
		do: anObject
		on: self