accessing
selected
	^ selected ifNil: [ selected := items isEmpty ifFalse: [ items first ] ]