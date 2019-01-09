translating
translate: aString
	^ self translator
		translate: aString
		inDomain: self domain