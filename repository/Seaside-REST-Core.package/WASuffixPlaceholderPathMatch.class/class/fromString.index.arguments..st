instance creation
fromString: aString index: anInteger arguments: aCollectionOfStrings
	| suffix |
	suffix := aString copyAfter: $}.
	^ self
		source: anInteger
		target: (self
			targetIndexOf: (aString copyFrom: 2 to: aString size - suffix size - 1)
			arguments: aCollectionOfStrings)
		suffix: suffix