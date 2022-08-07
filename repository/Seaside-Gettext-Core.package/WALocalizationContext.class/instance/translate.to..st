translating
translate: aString to: aLocale
	^ self translator 
		ifNil:[ aString ]
		ifNotNil:[ :t | t translate: aString usingLocale: aLocale ]