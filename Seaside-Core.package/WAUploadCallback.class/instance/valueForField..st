converting
valueForField: anObject
	^ (anObject isKindOf: WAFile) ifTrue: [ anObject ]