accessing-headers
headerAt: aString put: aValue
	"Sets a response header. Raises an error if the response is committed"

	self committedCheck.
	^ super headerAt: aString put: aValue