instance creation
name: aKeyString value: aValueString arguments: aCollectionOfStrings 
	^ ((self isPattern: aValueString)
		ifTrue: [ WAPlaceholderParameterMatch ]
		ifFalse: [ WAExactParameterMatch ]) name: aKeyString value: aValueString arguments: aCollectionOfStrings 