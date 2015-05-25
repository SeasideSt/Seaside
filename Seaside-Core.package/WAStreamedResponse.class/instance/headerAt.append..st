accessing-headers
headerAt: aString append: aValue
	self committedCheck.
	^ super headerAt: aString append: aValue