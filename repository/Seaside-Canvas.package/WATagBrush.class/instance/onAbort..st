attributes-events
onAbort: anObject
	"The abort event occurs when page loading is stopped before an image has been allowed to completely load."

	self document scriptGenerator
		event: 'abort'
		do: anObject
		on: self