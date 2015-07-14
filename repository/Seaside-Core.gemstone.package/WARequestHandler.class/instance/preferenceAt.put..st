configuration
preferenceAt: aSymbol put: anObject
	anObject isNil
		ifTrue: [ self configuration removeExpressionAt: aSymbol ]
		ifFalse: [ self configuration at: aSymbol put: anObject ].
	
	^ anObject