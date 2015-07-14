accessing-headers
removeHeaderAt: aString
	"Removes all occurences of the header. Raises an error if the response is committed."

	self committedCheck.
	^ super removeHeaderAt: aString