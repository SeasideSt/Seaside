querying
invoke: aString withAll: anArray
	"Invokes the same method, with the same arguments, for all items in a collection. Returns the results of the method calls."

	self call: 'invoke' withArguments: (Array with: aString) , anArray