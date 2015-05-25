converting
valueForField: anObject
	^ anObject isEmptyOrNil
		ifTrue: [ nil ]
		ifFalse: [ WAUrl absolute: anObject ]