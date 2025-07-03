accessing
selectedClass

	^ classSide
		ifTrue: [ classesPane selectedItem class ]
		ifFalse: [ classesPane selectedItem ]