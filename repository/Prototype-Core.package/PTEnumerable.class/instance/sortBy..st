querying
sortBy: anObject
	"Provides a custom-sorted view of the elements based on the criteria computed, for each element, by the iterator."

	self call: 'sortBy' with: (self iteratorFor: anObject)