utilities
each: anObject do: aFunction
	"Iterate over arrays and objects."

	self call: 'each' with: anObject with: aFunction asFunction