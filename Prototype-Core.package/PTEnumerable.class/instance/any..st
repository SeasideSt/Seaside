querying
any: anObject
	"Determines whether at least one element is boolean-equivalent to true, either directly or through computation by the provided iterator."

	self call: 'any' with: (self iteratorFor: anObject)