events
onStatus: anInteger do: anObject 
	"With anInteger being an HTTP status code for the response. Invoked when the response just completed, and the status code is exactly the one we used in the callback name. Prevents execution of onSuccess / onFailure. Happens before onComplete."
	self 
		optionAt: 'on' , anInteger greaseString
		put: anObject asFunction