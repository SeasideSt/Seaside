testing
matches: aMimeType
	^ matches anySatisfy: [ :each | each matches: aMimeType ]