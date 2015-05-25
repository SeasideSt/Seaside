private
valueFor: anObject
	^ valueBlock isNil
		ifTrue: [ anObject ]
		ifFalse: [ valueBlock value: anObject ]