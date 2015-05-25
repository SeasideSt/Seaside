accessing-status
status: aNumber message: aString
	"Set the response status. Raises an error if the response is committed."

	self committedCheck.
	^ super status: aNumber message: aString