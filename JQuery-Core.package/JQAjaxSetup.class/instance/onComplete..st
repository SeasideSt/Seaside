events
onComplete: anObject
	"A function to be called when the request finishes (after success and error callbacks are executed). The function gets passed two arguments: The XMLHttpRequest object and a string describing the type of success of the request."
	
	self optionAt: 'complete' put: anObject asFunction