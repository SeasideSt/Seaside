convenience
onError: anObject
	"The error event occurs when an image does not load properly or when an error occurs during script execution."

	self document scriptGenerator
		event: 'error'
		do: anObject
		on: self