accessors-smalltalk
do: anObject
	"Iterate over a jQuery object, executing a function for each matched element."
	
	self each: (self iteratorFor: anObject return: false)