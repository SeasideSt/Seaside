querying
invoke: aString with: anObject
	"Invokes the same method, with the same arguments, for all items in a collection. Returns the results of the method calls."

	self invoke: aString withAll: (Array with: anObject)