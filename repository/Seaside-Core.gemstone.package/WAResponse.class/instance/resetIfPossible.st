convenience
resetIfPossible
	"Try to reset the receiver, answer whether it was successful.
	Resetting may fail in stream method the response is already committed."
	self initializeFields.
	^ true