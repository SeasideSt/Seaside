accessing
form
	^ zoom
		ifFalse: [ UIManager default world imageForm ]
		ifTrue: [ self topWindow imageForm ]