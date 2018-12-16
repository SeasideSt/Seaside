testing
isCallbackSelector: aString 
	Symbol 
		hasInterned: aString
		ifTrue: [ :symbol | ^ self callbackSelectors includes: symbol ].
	^ false