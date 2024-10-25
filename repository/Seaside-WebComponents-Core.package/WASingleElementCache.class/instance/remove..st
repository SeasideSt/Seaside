removing
remove: anObject
	value = anObject ifTrue: [
		key := nil.
		value := nil ]