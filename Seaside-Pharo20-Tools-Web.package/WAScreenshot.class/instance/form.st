accessing
form
	^ zoom
		ifFalse: [ Display copy ]
		ifTrue: [ self topWindow imageForm ]