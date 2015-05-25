querying
min: anObject
	"Returns the minimum element (or element-based computation), or undefined if the enumeration is empty. Elements are either compared directly, or by first applying the iterator and comparing returned values."

	self call: 'min' with: (self iteratorFor: anObject)