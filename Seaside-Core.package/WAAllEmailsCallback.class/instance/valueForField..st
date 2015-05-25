converting
valueForField: anObject
	^ anObject isEmptyOrNil
		ifTrue: [ nil ]
		ifFalse: [ WAEmailAddress address: anObject ]