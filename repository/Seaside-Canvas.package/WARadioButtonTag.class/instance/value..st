attributes
value: anObject
	group isNil
		ifTrue: [ ^ super value: anObject ].
	group hasSelection 
		ifTrue: [ self selected: (group isSelected: anObject) ].
	group hasCallback 
		ifTrue: [ super value: (group callbackValue: anObject) ]