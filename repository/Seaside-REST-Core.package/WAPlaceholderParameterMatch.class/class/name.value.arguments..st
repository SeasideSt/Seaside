instance creation
name: aNameString value: aValueString arguments: aCollectionOfStrings
	^ self
		name: aNameString
		index: (self
			targetIndexOf: (aValueString copyFrom: 2 to: aValueString size - 1)
			arguments: aCollectionOfStrings)