accessing
parse: aString reviver: aFunction 
	"This method parses a JSON text to produce an object or array. The optional reviver parameter is a function that can filter and transform the results. It receives each of the keys and values, and its return value is used instead of the original value. If it returns what it received, then the structure is not modified. If it returns undefined then the member is deleted."

	self call: 'parse' with: aString with: aFunction asFunction