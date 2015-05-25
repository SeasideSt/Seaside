querying
max: anObject
	"Returns the maximum element (or element-based computation), or undefined if the enumeration is empty. Elements are either compared directly, or by first applying the iterator and comparing returned values."

	self call: 'max' with: (self iteratorFor: anObject)