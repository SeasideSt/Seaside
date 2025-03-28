accessing
keyAtValue: anObject ifAbsent: aBlock
	^ value = anObject
		ifTrue: [ key ]
		ifFalse: [ aBlock value ]