decorations
call: aString with: anObject1 with: anObject2 with: anObject3
	"Call the method named aString with anObject1 and anObject2 and anObject3 as its arguments."

	self call: aString withArguments: (Array with: anObject1 with: anObject2 with: anObject3)