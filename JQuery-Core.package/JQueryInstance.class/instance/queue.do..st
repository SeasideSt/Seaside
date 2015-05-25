data
queue: aString do: anObject
	"Manipulate the queue of functions to be executed on the matched elements."
	
	self call: 'queue' with: aString with: anObject asFunction