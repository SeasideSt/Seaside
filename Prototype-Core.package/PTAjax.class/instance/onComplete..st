events
onComplete: anObject
	"Triggered at the very end of a request's life-cycle, once the request completed, status-specific callbacks were called, and possible automatic behaviors were processed."

	self optionAt: 'onComplete' put: anObject asFunction