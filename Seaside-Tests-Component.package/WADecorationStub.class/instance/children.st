hooks
children
	^ childrenBlock isNil
		ifTrue: [ super children ]
		ifFalse: [ super children , childrenBlock value ]