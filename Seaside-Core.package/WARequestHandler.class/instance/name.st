accessing
name
	^ self isRoot
		ifTrue: [ '' ]
		ifFalse: [ self parent nameOfHandler: self ]