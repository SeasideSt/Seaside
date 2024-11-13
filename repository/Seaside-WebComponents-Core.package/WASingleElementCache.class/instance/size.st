accessing
size
	^ key isNil
		ifTrue: [ 0 ]
		ifFalse: [ 1 ]