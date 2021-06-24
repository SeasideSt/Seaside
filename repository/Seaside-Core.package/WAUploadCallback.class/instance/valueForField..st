converting
valueForField: anObject
	^ (anObject isKindOf: WAAbstractFile) ifTrue: [ anObject ]