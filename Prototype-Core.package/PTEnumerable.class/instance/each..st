querying
each: anObject
	"The cornerstone of Enumerable. It lets you iterate over all the elements in a generic fashion, then returns the Enumerable, thereby allowing chain-calling."

	self call: 'each' with: (self iteratorFor: anObject return: false)