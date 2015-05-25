testing
matches: aString
	^ (aString size > prefix size)
		and: [ aString beginsWithSubCollection: prefix ]