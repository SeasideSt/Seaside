querying
pluck: aString
	"Optimization for a common use-case of collect: fetching the same property for all the elements. Returns the property values."

	self call: 'pluck' with: aString