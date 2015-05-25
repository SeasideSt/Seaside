utilities
unique: anArray
	"Create a copy of an array of DOM elements with the duplicates removed. Note that this only works on arrays of DOM elements, not strings or numbers."
	
	self call: 'unique' with: anArray