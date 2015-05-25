querying
reject: anObject
	"Returns all the elements for which the iterator returned false."

	self call: 'reject' with: (self iteratorFor: anObject)