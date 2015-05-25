testing
matchesPath: aCollectionOfStrings
	^ self isOverlyComplex
		ifTrue: [ self matchesOverlyComplex: aCollectionOfStrings  ]
		ifFalse: [ self matchesModeratelyComplex: aCollectionOfStrings ]