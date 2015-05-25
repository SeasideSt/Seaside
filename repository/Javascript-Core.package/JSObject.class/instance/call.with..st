decorations
call: aString with: anObject
	"Call the method named aString with anObject as its argument."

	self call: aString withArguments: (Array with: anObject)