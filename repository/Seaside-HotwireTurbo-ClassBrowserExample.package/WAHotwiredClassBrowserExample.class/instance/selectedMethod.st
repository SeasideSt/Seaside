accessing
selectedMethod

	classesPane selectedItem ifNil: [ ^ nil ].
	methodsPane selectedItem ifNil: [ ^ nil ].
	^ self selectedClass >> methodsPane selectedItem