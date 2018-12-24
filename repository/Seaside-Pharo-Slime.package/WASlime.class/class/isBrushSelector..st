testing
isBrushSelector: aString
	Symbol 
		hasInterned: aString
		ifTrue: [ :symbol | ^ self brushSelectors includes: symbol ].
	^ false