decorations
call: aString with: anObject1 with: anObject2
	"Call the method named aString with anObject1 and anObject2 as its arguments."

	self call: aString withArguments: (Array with: anObject1 with: anObject2)