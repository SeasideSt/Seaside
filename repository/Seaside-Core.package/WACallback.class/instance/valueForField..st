converting
valueForField: anObject
	"Answer the value that should be used when the field value in the Request
	is anObject. This allows subclasses to specify a default value other than
	nil, for example."

	^ anObject