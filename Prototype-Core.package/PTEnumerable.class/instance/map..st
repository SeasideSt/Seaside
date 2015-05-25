querying
map: anObject
	"Returns the results of applying the iterator to each element."

	self call: 'map' with: (self iteratorFor: anObject)