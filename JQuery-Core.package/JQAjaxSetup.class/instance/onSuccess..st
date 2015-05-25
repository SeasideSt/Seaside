events
onSuccess: anObject
	"A function to be called if the request succeeds. The function gets passed two arguments: The data returned from the server, formatted according to the 'dataType' parameter, and a string describing the status."
	
	self optionAt: 'success' put: anObject asFunction