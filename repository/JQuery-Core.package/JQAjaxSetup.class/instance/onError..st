events
onError: anObject
	"A function to be called if the request fails. The function is passed three arguments: The XMLHttpRequest object, a string describing the type of error that occurred and an optional exception object, if one occurred. Possible values for the second argument (besides null) are 'timeout', 'error', 'notmodified' and 'parsererror'."
	
	self optionAt: 'error' put: anObject asFunction