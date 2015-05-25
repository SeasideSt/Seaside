querying
all: anObject
	"Determines whether all the elements are boolean-equivalent to true, either directly or through computation by the provided iterator."

	self call: 'all' with: (self iteratorFor: anObject)