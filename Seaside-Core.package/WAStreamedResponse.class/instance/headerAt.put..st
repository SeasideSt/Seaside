accessing-headers
headerAt: aString put: aValue
	self committedCheck.
	^ super headerAt: aString put: aValue