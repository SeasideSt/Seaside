accessing
nextPutAll: aString
	"We need to ensure to flush the buffer after writing a string to the document."

	super nextPutAll: aString.
	self flushBuffer