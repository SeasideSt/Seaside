accessing
offset
	^ zoom
		ifTrue: [ self topWindow position ]
		ifFalse: [ 0@0 ]