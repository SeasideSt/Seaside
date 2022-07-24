translating
translate: aString
	^ self translator 
		ifNil:[ aString ]
		ifNotNil:[:t | t translate: aString usingLocale: self locale ]
	