utilities
grep: anObject select: aFunction
	"Find the elements of an array that satisfy a filter function."

	self call: 'grep' with: anObject with: aFunction asFunction