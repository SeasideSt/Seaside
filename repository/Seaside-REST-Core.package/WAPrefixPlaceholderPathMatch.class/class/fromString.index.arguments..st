instance creation
fromString: aString index: anInteger arguments: aCollectionOfStrings
	| prefix |
	prefix := aString copyUpTo: ${.
	^ self
		source: anInteger
		target: (self
			targetIndexOf: (aString copyFrom: prefix size + 2 to: aString size - 1)
			arguments: aCollectionOfStrings)
		prefix: prefix