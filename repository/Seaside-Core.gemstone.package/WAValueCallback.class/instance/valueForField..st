converting
valueForField: anObject
	"For most ValueCallbacks, it is more convenient to work with an empty String
	than with nil when the HTML input is empty."
	
	^ anObject ifNil: [ String new ]