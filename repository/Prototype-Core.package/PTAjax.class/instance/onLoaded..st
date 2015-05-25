events
onLoaded: anObject
	"(Not guaranteed) Triggered once the underlying XHR object is setup, the connection open, and ready to send its actual request."

	self optionAt: 'onLoaded' put: anObject asFunction