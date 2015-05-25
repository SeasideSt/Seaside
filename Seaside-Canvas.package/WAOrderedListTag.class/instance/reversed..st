attributes
reversed: aBoolean
	"The reversed attribute is a boolean attribute. If present, it indicates that the list is a descending list (..., 3, 2, 1). If the attribute is omitted, the list is an ascending list (1, 2, 3, ...)."
	self attributes at: 'reversed' put: aBoolean