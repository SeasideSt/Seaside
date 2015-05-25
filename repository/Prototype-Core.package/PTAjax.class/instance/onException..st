events
onException: anObject
	"Triggered whenever an XHR error arises. Has a custom signature: the first argument is the requester, the second is the exception object."

	self optionAt: 'onException' put: anObject asFunction