accessing
morph
	^ zoom
		ifFalse: [ UIManager default world ]
		ifTrue: [ self topWindow ]