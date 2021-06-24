accessing
size
	^ self exists
		ifTrue: [ self fileReference size ]
		ifFalse: [ 0 ]