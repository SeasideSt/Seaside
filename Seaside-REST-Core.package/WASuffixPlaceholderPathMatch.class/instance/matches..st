testing
matches: aString
	^ (aString size > suffix size)
		and: [ aString endsWithSubCollection: suffix ]