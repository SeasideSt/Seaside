accessing-headers
headerAt: aString append: aValue
	"Appends a response header. Raises an error if the respone is committed."

	self committedCheck.
	^ super headerAt: aString append: aValue