instance creation
fromString: aString index: anInteger arguments: aCollectionOfStrings
	^ (self matchClassFor: aString)
		fromString: aString index: anInteger arguments: aCollectionOfStrings