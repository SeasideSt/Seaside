hooks
children
	^ childrenBlock isNil
		ifTrue: [ super children ]
		ifFalse: [ childrenBlock value ]