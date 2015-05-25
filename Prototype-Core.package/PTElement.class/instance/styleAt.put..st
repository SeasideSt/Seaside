styling-styles
styleAt: aPropertyString put: anObject
	"Modifies element's CSS style properties. Styles are passed as a hash of property-value pairs in which the properties are specified in their camelized form."

	self style: (Dictionary new
		at: aPropertyString put: anObject;
		yourself)