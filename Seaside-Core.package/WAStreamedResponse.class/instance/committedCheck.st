private
committedCheck
	"Raises a signal if this response is already committed."

	self isCommitted 
		ifTrue: [ WAIllegalStateException signal ]