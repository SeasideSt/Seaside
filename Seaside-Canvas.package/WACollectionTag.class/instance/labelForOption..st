private
labelForOption: anObject
	^ labelBlock isNil
		ifTrue: [ anObject ]
		ifFalse: [ labelBlock value: anObject ]