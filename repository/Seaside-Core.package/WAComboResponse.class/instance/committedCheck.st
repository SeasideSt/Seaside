errors
committedCheck
	"Raises a singal if this response is already committed."

	self isCommitted 
		ifTrue: [ WAIllegalStateException signal ]