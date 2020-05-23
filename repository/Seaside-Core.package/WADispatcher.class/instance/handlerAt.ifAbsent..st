accessing
handlerAt: aString ifAbsent: aBlock
	aString isNil
		ifTrue: [ ^ aBlock value ].
	^ self handlers
		at: aString
		ifAbsent: aBlock