instance creation
fromString: aString index: anInteger arguments: aCollectionOfStrings
	^ self
		source: anInteger
		target: (self
			targetIndexOf: (aString copyFrom: 2 to: aString size - 1)
			arguments: aCollectionOfStrings)